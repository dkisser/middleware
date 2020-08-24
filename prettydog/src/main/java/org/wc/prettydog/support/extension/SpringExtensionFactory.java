package org.wc.prettydog.support.extension;

import org.springframework.context.ApplicationContext;
import org.wc.prettydog.util.ConcurrentHashSet;

import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/1/19.
 */
public class SpringExtensionFactory implements ExtensionFactory{

    private static Set<ApplicationContext> contextset = new ConcurrentHashSet<>();

    public static void addApplicationContext (ApplicationContext context){contextset.add(context);}

    @Override
    public <T> T getExtension(Class<T> clz, String name) {
        for (ApplicationContext context:contextset){
            T t = context.getBean(name,clz);
            if (t != null){
                return t;
            }
        }
        return null;
    }
}
