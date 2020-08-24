package org.wc.midware.transporter.netty;

import org.junit.Before;
import org.junit.Test;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.transporter.NettyClient;
import org.wc.midware.netbar.transporter.NettyServer;

import java.io.IOException;

/**
 * Created by WenChen on 2020/8/11.
 */
public class NettyServerTest2 {

    private URL url;

    @Before
    public void init(){
        String urlStr = "netbar://127.0.0.1:6666?consumer.timeout=10000&provider.timeout=10000";
        url = URL.valueOf(urlStr);
    }

    @Test
    public void test() throws IOException {
        NettyServer server = new NettyServer(url,NetbarServerInvoker.newInstance());
        server.start();
        System.in.read();
    }
}
