package org.wc.webserver.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;

/**
 * Created by WenChen on 2020/1/19.
 */

public class SpringApplicationContext implements ApplicationContextInitializer {

    private static ApplicationContext context;

    public static Object getObject (String name){
        return context.getBean(name);
    }

    public static <T> T getObjct(Class<T> clz,String name){
        return context.getBean(name,clz);
    }

    @Override
    public void initialize(ConfigurableApplicationContext configurableApplicationContext) {
        context = configurableApplicationContext;
    }
}
