package org.wc.prettydog.util.jdk.listener;

import java.util.EventObject;

/**
 * 监听器实现
 * Created by WenChen on 2019/12/2.
 */
public class TestListener implements Listener {

    @Override
    public void onEventListener(ApplicationEvent event) {
        System.out.println(event.toString());
    }
}
