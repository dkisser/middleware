package org.wc.prettydog.mselect.registry;

import org.wc.prettydog.annotation.SPI;
import org.wc.prettydog.mselect.transporter.ZookeeperListener;

/**
 * Created by WenChen on 2020/6/18.
 */
@SPI(ZookeeperRegistry.NAME)
public interface Registry {

    void subscribe(String path, ZookeeperListener listener) throws Exception;

    void unsubscribe(String path) throws Exception;
}
