package org.wc.midware.netbar.core.config;

import org.wc.midware.netbar.api.Protocol;
import org.wc.midware.netbar.api.remote.Server;
import org.wc.midware.netbar.api.Service;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.common.config.AbstractConfigBean;
import org.wc.prettydog.mselect.transporter.ZookeeperListener;
import org.wc.prettydog.support.ExtensionLoader;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/8/7.
 */
public abstract class AbstractServiceConfigBean extends AbstractConfigBean implements Service {

    private URL url;

    private Protocol protocol;

    private static ConcurrentHashMap<String,ZookeeperListener> listeners = new ConcurrentHashMap<>(16);

    private Object REFRESH_LOCK = new Object();

    public AbstractServiceConfigBean(URL url) {
        this.url = url;
        this.protocol = ExtensionLoader.getExtensionLoader(Protocol.class).getExtensionById("netbar");
    }

    @Override
    public void service() {
        //init
        setRegistry().setZkClient();
        try {
            //register
//            getZkClient().create(url.getSubsctibePath("configurator"),true);
            url.addArgument("timestamp",System.currentTimeMillis());
            getZkClient().create(url.getRegistPath("provider"),true);
            //subscribe
//            getRegistry().subscribe(url.getSubsctibePath("configurator"),this);
//            listeners.putIfAbsent(url.getSubsctibePath("configurator"),this);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //start server
        protocol.export(url);
    }

}
