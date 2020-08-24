package org.wc.prettydog.support.extension;

import org.wc.prettydog.support.ExtensionLoader;

import java.security.cert.Extension;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by WenChen on 2020/1/19.
 */
public class DefaultExtensionFactory implements ExtensionFactory {

    private List<ExtensionFactory> factories;

    public DefaultExtensionFactory() {
        ExtensionLoader<ExtensionFactory> loader = ExtensionLoader.getExtensionLoader(ExtensionFactory.class);
        List<ExtensionFactory> list = new ArrayList<>();
        for (String s:loader.getSupportExtension()){
            list.add(loader.getExtensionById(s));
        }
        this.factories = Collections.unmodifiableList(list);
    }

    @Override
    public <T> T getExtension(Class<T> clz, String name) {
        for(ExtensionFactory factory:factories){
            T t = factory.getExtension(clz,name);
            if (t != null){
                return t;
            }
        }
        return null;
    }
}
