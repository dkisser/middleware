package org.wc.prettydog.support.zookeeper;

import org.junit.Test;
import org.wc.prettydog.mselect.URL;
import org.wc.prettydog.mselect.registry.PrettyRegistry;

import java.io.IOException;

/**
 * Created by WenChen on 2020/6/22.
 */
public class PrettyRegistryTest {

    @Test
    public void testRegistry(){
        PrettyRegistry pretty = new PrettyRegistry();
        for (int i=0;i<5;i++){
            URL url = new URL();
            url.setGroup("testListener").setPort("111"+i)
                    .setProtocol("aabb").addArgument("xxx","bbb")
                    .addArgument("yyy","aaa");
            try {
                pretty.subscribe(url);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        try {
            System.in.read();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
