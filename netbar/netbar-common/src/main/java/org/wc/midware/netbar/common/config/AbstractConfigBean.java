package org.wc.midware.netbar.common.config;


import org.wc.prettydog.mselect.registry.Registry;
import org.wc.prettydog.mselect.transporter.ZookeeperClient;

/**
 * Created by WenChen on 2020/8/7.
 */
public abstract class AbstractConfigBean {


    private Registry registry;

    private ZookeeperClient zkClient;

    public abstract Registry getRegistry();

    public AbstractConfigBean setRegistry() {
        this.registry = getRegistry();
        return this;
    }

    public abstract ZookeeperClient getZkClient();

    public AbstractConfigBean setZkClient() {
        this.zkClient = getZkClient();
        return this;
    }
}
