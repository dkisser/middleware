package org.wc.midware.netbar.test.config;

import org.junit.Before;
import org.junit.Test;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.core.config.ReferenceConfigBean;
import org.wc.midware.netbar.core.config.ServiceConfigBean;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by WenChen on 2020/8/17.
 */
public class ReferenceConfigBeanTest {

    private URL url;

    @Before
    public void init(){
        String urlStr = "netbar://127.0.0.1:6666?consumer.timeout=10000&provider" +
                ".timeout=10000&serviceId=test11&group=fd&version=ew&impl=1";
        url = URL.valueOf(urlStr);
    }

    @Test
    public void testRefer() throws IOException {
        ReferenceConfigBean config = new ReferenceConfigBean(url);
        Map<String,Object> request = new HashMap<>();
        request.put("test",1);
        request.put("tese",3);
        for (int i=0;i<30;i++){
            try {
                System.out.println(config.refer(request));
                Thread.sleep(2000L);
            } catch (Exception e){
                e.printStackTrace();
            }

        }
        System.in.read();
    }
}
