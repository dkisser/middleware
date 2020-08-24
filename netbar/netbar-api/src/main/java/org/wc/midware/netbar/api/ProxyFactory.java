package org.wc.midware.netbar.api;

import org.wc.prettydog.annotation.SPI;

/**
 * Created by WenChen on 2020/8/13.
 */
@SPI("reflect")
public interface ProxyFactory {

    <T> T getProxy(URL url) throws Exception;
}
