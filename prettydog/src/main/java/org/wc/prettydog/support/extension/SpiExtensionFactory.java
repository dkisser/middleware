package org.wc.prettydog.support.extension;

import org.wc.prettydog.support.ExtensionLoader;

/**
 * Created by WenChen on 2020/1/19.
 */
public class SpiExtensionFactory implements ExtensionFactory {

    @Override
    public <T> T getExtension(Class<T> clz, String name) {
        return ExtensionLoader.getExtensionLoader(clz).getExtensionById(name);
    }
}
