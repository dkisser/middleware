package org.wc.prettydog.support.zookeeper;

import org.junit.Test;
import org.wc.prettydog.mselect.URL;
import org.wc.prettydog.mselect.registry.PrettyRegistry;

/**
 * Created by WenChen on 2020/6/22.
 */
public class PrettyRegistryTest2 {

    @Test
    public void testRegistry(){
        PrettyRegistry pretty = new PrettyRegistry();
        URL url = new URL();
        url.setGroup("testListener").setPort("3111")
                .setProtocol("aabb").addArgument("xxx","bbb")
                .addArgument("yyy","aaa");
        try {
            pretty.subscribe(url);
            Thread.sleep(70*1000L);
//            System.in.read();
            pretty.unsubscribe(url);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
