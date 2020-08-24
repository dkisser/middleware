package org.wc.prettydog.support.extension;

import org.wc.prettydog.annotation.SPI;

/**
 * Created by WenChen on 2020/1/19.
 */
@SPI("default")
public interface ExtensionFactory {

    <T> T getExtension (Class<T> clz,String name);

}
