package org.wc.prettydog.mselect.registry;

import org.wc.prettydog.mselect.transporter.ZookeeperListener;
import org.wc.prettydog.util.StringUtils;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/6/19.
 */
public abstract class AbstractRegistry implements Registry{

    private Map<String,ZookeeperListener> subscribed = new ConcurrentHashMap<>();

    @Override
    public void subscribe(String path, ZookeeperListener listener) throws Exception{
        if (StringUtils.isEmpty(path)){
            throw new IllegalArgumentException("path can't be null or empty string");
        }
        if (listener == null){
            throw new IllegalArgumentException("listener can't be null");
        }
        subscribed.putIfAbsent(path,listener);
    }

    @Override
    public void unsubscribe(String path) throws Exception{
        if (StringUtils.isEmpty(path)){
            throw new IllegalArgumentException("path can't be null or empty string");
        }
        subscribed.remove(path);
    }

//    public ZookeeperListener getSubscribedListener(String path){
//        return subscribed.get(path)
//    }
}
