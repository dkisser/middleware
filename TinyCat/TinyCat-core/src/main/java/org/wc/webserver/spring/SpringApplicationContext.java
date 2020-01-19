package org.wc.webserver.spring;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * Created by WenChen on 2020/1/19.
 */
@Component
public class SpringApplicationContext implements ApplicationContextAware{

    private static ApplicationContext context;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        context = applicationContext;
    }

    public static Object getObject (String name){
        return context.getBean(name);
    }

    public static <T> T getObjct(Class<T> clz,String name){
        return context.getBean(name,clz);
    }
}
