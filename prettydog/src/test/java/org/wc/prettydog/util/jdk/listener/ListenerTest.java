package org.wc.prettydog.util.jdk.listener;

import org.junit.Test;

/**
 * 测试类
 * Created by WenChen on 2019/12/2.
 */
public class ListenerTest {

    @Test
    public void test(){
        TestApplicationEvent event = new TestApplicationEvent();
        event.addListeners(new TestListener());
        event.onRefresh();
    }

}
