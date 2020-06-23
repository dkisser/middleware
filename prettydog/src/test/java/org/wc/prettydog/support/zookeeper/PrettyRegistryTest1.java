package org.wc.prettydog.support.zookeeper;

import org.junit.Test;
import org.wc.prettydog.mselect.URL;
import org.wc.prettydog.mselect.registry.PrettyRegistry;

/**
 * Created by WenChen on 2020/6/22.
 */
public class PrettyRegistryTest1 {

    @Test
    public void testRegistry(){
        PrettyRegistry pretty = new PrettyRegistry();
        URL url = new URL();
        url.setGroup("testListener").setPort("2111")
                .setProtocol("aabb").addArgument("xxx","bbb")
                .addArgument("yyy","aaa");
        try {
            pretty.subscribe(url);
            Thread.sleep(60*1000L);
            pretty.unsubscribe(url);
            Thread.sleep(50*1000L);
            pretty.subscribe(url);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
