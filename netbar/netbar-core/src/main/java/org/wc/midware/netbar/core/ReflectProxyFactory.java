package org.wc.midware.netbar.core;

import org.wc.midware.netbar.api.ProxyFactory;
import org.wc.midware.netbar.api.URL;
import org.wc.prettydog.util.StringUtils;

import java.util.Optional;

/**
 * Created by WenChen on 2020/8/13.
 */
public class ReflectProxyFactory implements ProxyFactory {

    @Override
    public <T> T getProxy(URL url) throws Exception {
        String impl = url.getImpl();
        if (!StringUtils.hasText(impl)){
            throw new RuntimeException(String.format("can't find implement for %s:%s",url.getServiceId(),url.getImpl()));
        }
        ClassLoader classLoader = Optional.ofNullable(Thread.currentThread().getContextClassLoader())
                                    .orElseGet(()-> ClassLoader.getSystemClassLoader());
        return (T) classLoader.loadClass(impl).newInstance();
    }
}
