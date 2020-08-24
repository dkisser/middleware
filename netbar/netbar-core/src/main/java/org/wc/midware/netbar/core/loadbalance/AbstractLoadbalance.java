package org.wc.midware.netbar.core.loadbalance;

import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.api.cluster.Loadbalance;

import java.util.List;

/**
 * Created by WenChen on 2020/8/17.
 */
public abstract class AbstractLoadbalance implements Loadbalance {

    @Override
    public URL select(List<URL> invokers) {
        if (invokers.size() == 1){
            return invokers.get(0);
        } else {
            return doSelect(invokers);
        }
    }

    public abstract URL doSelect(List<URL> urls);
}
