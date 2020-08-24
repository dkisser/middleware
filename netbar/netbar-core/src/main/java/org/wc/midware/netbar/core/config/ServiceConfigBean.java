package org.wc.midware.netbar.core.config;

import org.wc.midware.netbar.api.remote.Server;
import org.wc.midware.netbar.api.URL;
import org.wc.prettydog.mselect.registry.Registry;
import org.wc.prettydog.mselect.transporter.ZookeeperClient;
import org.wc.prettydog.support.ExtensionLoader;

/**
 * Created by WenChen on 2020/8/7.
 */
public class ServiceConfigBean extends AbstractServiceConfigBean {

    public ServiceConfigBean(URL url) {
        super(url);
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
