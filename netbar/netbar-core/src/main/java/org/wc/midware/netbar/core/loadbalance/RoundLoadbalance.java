package org.wc.midware.netbar.core.loadbalance;

import org.wc.midware.netbar.api.URL;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by WenChen on 2020/8/17.
 */
public class RoundLoadbalance extends AbstractLoadbalance {

    private static AtomicInteger mid = new AtomicInteger(0);

    @Override
    public URL doSelect(List<URL> urls) {
        int index = mid.getAndIncrement() % urls.size();
        System.out.println("selected:"+urls.get(index).getIpAndPortStr());
        return urls.get(index);
    }
}
