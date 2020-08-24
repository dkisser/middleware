package org.wc.midware.netbar.api;

import org.wc.midware.netbar.api.remote.Request;
import org.wc.prettydog.annotation.SPI;

/**
 * Created by WenChen on 2020/8/13.
 */
@SPI
public interface Protocol {

    Exporter export(URL url);

    Invoker refer();

    void distroy();

}
