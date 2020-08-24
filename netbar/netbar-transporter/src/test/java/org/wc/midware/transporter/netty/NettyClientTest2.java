package org.wc.midware.transporter.netty;

import org.junit.Before;
import org.junit.Test;
import org.wc.midware.netbar.api.Invocation;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.api.remote.Result;
import org.wc.midware.netbar.transporter.NettyClient;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by WenChen on 2020/8/11.
 */
public class NettyClientTest2 {

    private URL url;

    @Before
    public void init(){
        String urlStr = "netbar://127.0.0.1:6666?consumer.timeout=10000&provider" +
                ".timeout=10000&serviceId=1111&impl=org.wc.midware.common.DefaultRPCHandlerImpl&group=0&version=0.1";
        url = URL.valueOf(urlStr);
    }

    @Test
    public void test() throws IOException {
        NettyClient client = new NettyClient(url);
        Result map = client.request(new Invocation() {

            @Override
            public Map getRequest() {
                Map<String,Object> map = new HashMap<>();
                map.put("testbody","1");
                return map;
            }

            @Override
            public URL getUrl() {
                return url;
            }
        });
        System.out.println("return:"+map.toString());
        System.in.read();
    }

}
