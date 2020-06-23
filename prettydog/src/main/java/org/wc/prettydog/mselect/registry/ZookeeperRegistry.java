package org.wc.prettydog.mselect.registry;

import org.wc.prettydog.mselect.transporter.ZookeeperClient;
import org.wc.prettydog.mselect.transporter.ZookeeperListener;
import org.wc.prettydog.support.ExtensionLoader;

/**
 * Created by WenChen on 2020/6/19.
 */
public class ZookeeperRegistry extends AbstractRegistry {

    public static final String NAME = "zookeeper";

    private ZookeeperClient zookeeperClient;

    public ZookeeperRegistry() {
        zookeeperClient = ExtensionLoader.getExtensionLoader(ZookeeperClient.class)
                                .getDefaultExtension();
    }

    @Override
    public void subscribe(String path, ZookeeperListener listener) throws Exception{
        super.subscribe(path, listener);
        doSubscribe(path,listener);
    }

    @Override
    public void unsubscribe(String path) throws Exception{
        super.unsubscribe(path);
        doUnsubscribe(path);
    }

    protected void doSubscribe (String path, ZookeeperListener listener) throws Exception{
        zookeeperClient.createEphemeralSequence(path);
        zookeeperClient.addListener(path,listener);
    }

    protected void doUnsubscribe (String path) throws Exception {
        zookeeperClient.delete(path);
    }
}
