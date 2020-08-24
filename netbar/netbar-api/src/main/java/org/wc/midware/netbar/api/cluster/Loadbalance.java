package org.wc.midware.netbar.api.cluster;

import org.wc.midware.netbar.api.Invoker;
import org.wc.midware.netbar.api.URL;
import org.wc.prettydog.annotation.SPI;

import java.util.List;

/**
 * Created by WenChen on 2020/8/12.
 */
@SPI("random")
public interface Loadbalance {

    URL select (List<URL> invokers);

}
