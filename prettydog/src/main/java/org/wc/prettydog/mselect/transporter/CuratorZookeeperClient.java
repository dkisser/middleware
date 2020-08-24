package org.wc.prettydog.mselect.transporter;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.api.CuratorWatcher;
import org.apache.curator.retry.RetryNTimes;
import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.WatchedEvent;
import org.springframework.context.EnvironmentAware;
import org.springframework.core.env.Environment;
import org.wc.prettydog.util.StringUtils;

import java.util.Collections;
import java.util.List;

/**
 * Created by WenChen on 2020/6/19.
 */
public class CuratorZookeeperClient extends AbstractZookeeperClient<CuratorWatcher> implements EnvironmentAware{

    public static final String NAME = "curator";

    private CuratorFramework curatorFramework;

    private Environment environment;

    public CuratorZookeeperClient() {
        this.curatorFramework = CuratorFrameworkFactory.builder()
                .connectString("127.0.0.1:2181")
                .retryPolicy(new RetryNTimes(1,1000))
                .connectionTimeoutMs(50000)
                .build();
        this.curatorFramework.start();
    }

    @Override
    protected List<String> addListener(String path, CuratorWatcher listner) {
        try {
            return curatorFramework.getChildren().usingWatcher(listner).forPath(path);
        } catch (KeeperException.NoNodeException e){
            return Collections.emptyList();
        } catch (Exception e) {
            throw new IllegalStateException(e.getMessage(),e);
        }
    }

    @Override
    protected CuratorWatcher createTargetListener(String path, ZookeeperListener listener) {
        return new CuratorWatcherImpl(listener);
    }

    @Override
    protected void doCreateEphemeral(String path) {
        try {
            curatorFramework.create().withMode(CreateMode.EPHEMERAL).forPath(path);
        } catch (KeeperException.NodeExistsException e){
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected String doCreatePersistent(String path) {
        try {
            return curatorFramework.create().forPath(path);
        } catch (KeeperException.NodeExistsException e){
            return null;
        } catch (Exception e) {
            throw new IllegalStateException(e.getMessage(),e);
        }
    }

    @Override
    protected boolean checkExists(String path) {
        try {
            return curatorFramework.checkExists().forPath (path)!=null ? true:false;
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    protected void doClose() {
        curatorFramework.close();
    }

    @Override
    protected String doCreateEphemeralSequence(String path) {
        try {
            return curatorFramework.create()
                    .withMode(CreateMode.EPHEMERAL_SEQUENTIAL)
                    .forPath(path);
        } catch (KeeperException.NodeExistsException e) {
            return null;
        } catch (Exception e) {
            throw new IllegalStateException(e.getMessage(),e);
        }
    }

    @Override
    public void delete(String path) {
        if (checkExists(path)){
            try {
                curatorFramework.delete().forPath(path);
            } catch (KeeperException.NoNodeException e) {
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<String> select(String path) {
        try {
            return curatorFramework.getChildren().forPath(path);
        } catch (KeeperException.NoNodeException e) {
            return Collections.emptyList();
        } catch (Exception e) {
            throw new IllegalStateException(e.getMessage(),e);
        }
    }

    @Override
    public void setEnvironment(Environment environment) {
        this.environment = environment;
    }

    private class CuratorWatcherImpl implements CuratorWatcher{

        private ZookeeperListener listener;

        public CuratorWatcherImpl(ZookeeperListener listener) {
            this.listener = listener;
        }

        @Override
        public void process(WatchedEvent watchedEvent) throws Exception {
            String path = watchedEvent.getPath() == null ? "":watchedEvent.getPath();
            if (StringUtils.isEmpty(path)){
                return;
            }
            if (!checkExists(path)){//child node might deleted,wo need find it's parent path
                path = path.substring(0,path.lastIndexOf("/"));
            }
            listener.notify(curatorFramework.getChildren().forPath(path));
        }
    }
}
