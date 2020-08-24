package org.wc.midware.netbar.core.protocol;

import org.wc.midware.netbar.api.Exporter;
import org.wc.midware.netbar.api.Invoker;
import org.wc.midware.netbar.api.Protocol;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.core.NetbarClientInvoker;
import org.wc.midware.netbar.core.NetbarExporter;
import org.wc.midware.netbar.core.NetbarServerInvoker;
import org.wc.midware.netbar.transporter.NettyServer;

/**
 * Created by WenChen on 2020/8/13.
 */
public class NetbarProtocol extends AbstractProtocol implements Protocol {

    @Override
    public Exporter export(URL url) {
        String serviceKey = url.getServiceKey();
        Invoker invoker = NetbarServerInvoker.newInstance();
        new NettyServer(url,invoker).start();
        NetbarExporter exporter = new NetbarExporter(serviceKey,invoker);
        registExporter(serviceKey,exporter);
        registUrl(serviceKey,url);
        return exporter;
    }

    @Override
    public Invoker refer() {
        return new NetbarClientInvoker();
    }
}
