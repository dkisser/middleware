package org.wc.midware.netbar.core;

import org.wc.midware.netbar.api.Invocation;
import org.wc.midware.netbar.api.Invoker;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.api.remote.Client;
import org.wc.midware.netbar.api.remote.Result;
import org.wc.midware.netbar.transporter.NettyClient;

/**
 * Created by WenChen on 2020/8/13.
 */
public class NetbarClientInvoker extends AbstractClientInvoker {

    @Override
    public Client createClient(URL url) {
        return new NettyClient(url);
    }

    @Override
    public void destroy() {

    }
}
