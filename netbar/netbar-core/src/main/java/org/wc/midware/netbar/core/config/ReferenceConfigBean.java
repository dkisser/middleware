package org.wc.midware.netbar.core.config;

import org.wc.midware.netbar.api.cluster.Loadbalance;
import org.wc.midware.netbar.api.remote.Client;
import org.wc.midware.netbar.api.cluster.Cluster;
import org.wc.midware.netbar.api.URL;
import org.wc.prettydog.mselect.registry.Registry;
import org.wc.prettydog.mselect.transporter.ZookeeperClient;
import org.wc.prettydog.support.ExtensionLoader;

import java.util.List;

/**
 * Created by WenChen on 2020/8/7.
 */
public class ReferenceConfigBean extends AbstractReferenceConfigBean {

    public ReferenceConfigBean(URL url) {
        super(url);
    }

    @Override
    protected Loadbalance getLoadbalance() {
//        return ExtensionLoader.getExtensionLoader(Loadbalance.class).getExtensionById("round");
        return ExtensionLoader.getExtensionLoader(Loadbalance.class).getExtensionById("random");
    }

    @Override
    public Registry getRegistry() {
        return ExtensionLoader.getExtensionLoader(Registry.class)
                .getDefaultExtension();
    }

    @Override
    public ZookeeperClient getZkClient() {
        return ExtensionLoader.getExtensionLoader(ZookeeperClient.class)
                .getDefaultExtension();
    }

}
