package org.wc.prettydog.mselect.transporter;

import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/6/19.
 */
public abstract class AbstractZookeeperClient<TargetListener> implements ZookeeperClient {

    private static final Logger logger = LoggerFactory.getLogger(AbstractZookeeperClient.class);

    private volatile boolean isClosed = false;

    private Map<String,Map<ZookeeperListener,TargetListener>> listeners = new ConcurrentHashMap<>();

    @Override
    public void create(String path,boolean ephemeral) {
        if (!ephemeral) {
            if (checkExists(path)) {
                return;
            }
        }
        int index = path.lastIndexOf("/");
        if (index > 0) {
            create(path.substring(0, index), false);
        }
        if (ephemeral){
            doCreateEphemeral(path);
        } else {
            doCreatePersistent(path);
        }
    }

    @Override
    public String createEphemeralSequence (String path) {
        int index = path.lastIndexOf("/");
        if (index > 0) {
            create(path.substring(0,index),false);
        }
        return doCreateEphemeralSequence(path);
    }

    @Override
    public List<String> addListener(String path, ZookeeperListener listener) {
        Map<ZookeeperListener,TargetListener> lis = listeners.get(path);
        if (lis == null){
            listeners.putIfAbsent(path,new ConcurrentHashMap<>());
            lis = listeners.get(path);
        }
        TargetListener targetListener = lis.get(listener);
        if (targetListener == null){
            lis.putIfAbsent(listener,createTargetListener(path,listener));
            targetListener = lis.get(listener);
        }
        return addListener(path,targetListener);
    }

    @Override
    public void close() {
        if (isClosed){
            return;
        }
        isClosed = true;
        try {
            doClose();
        } catch (Throwable t){
            logger.warn(t);
        }
    }

    protected abstract List<String> addListener(String path, TargetListener listner);

    protected abstract TargetListener createTargetListener(String path,ZookeeperListener listener);

    protected abstract void doCreateEphemeral(String path);

    protected abstract String doCreatePersistent(String path);

    protected abstract boolean checkExists (String path);

    protected abstract void doClose() throws Exception;

    protected abstract String doCreateEphemeralSequence(String path);

}
