package org.wc.midware.netbar.api.remote;

import org.wc.prettydog.annotation.SPI;

/**
 * Created by WenChen on 2020/8/5.
 */
@SPI("netty")
public interface Server {

    void start();

    void stop();
}
