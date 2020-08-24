package org.wc.midware.netbar.api.remote;

import org.wc.midware.netbar.api.Invocation;
import org.wc.prettydog.annotation.SPI;

import java.util.Map;

/**
 * Created by WenChen on 2020/8/5.
 */
@SPI("netty")
public interface Client {

    Result request(Invocation invocation);

    boolean isAvaliable();

}
