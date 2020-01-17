package org.wc.tinycat.autoconfig;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.context.event.ContextRefreshedEvent;
import org.wc.webserver.BootStrapMain;

/**
 * Created by WenChen on 2020/1/17.
 */
public class TinyCatApplicationListener implements ApplicationListener<ApplicationEvent> {

    @Override
    public void onApplicationEvent(ApplicationEvent applicationEvent) {
        if (applicationEvent instanceof ContextRefreshedEvent){
            BootStrapMain.start();
        } else if (applicationEvent instanceof ContextClosedEvent){
            BootStrapMain.stop();
        }
    }
}
