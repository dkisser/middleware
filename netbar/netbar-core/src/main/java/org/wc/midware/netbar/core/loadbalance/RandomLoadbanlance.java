package org.wc.midware.netbar.core.loadbalance;

import org.wc.midware.netbar.api.URL;

import java.util.List;
import java.util.Random;

/**
 * Created by WenChen on 2020/8/17.
 */
public class RandomLoadbanlance extends AbstractLoadbalance{

    private static Random random = new Random();

    @Override
    public URL doSelect(List<URL> urls) {
        int index = random.nextInt(urls.size());
        System.out.println("selected:"+urls.get(index).getIpAndPortStr());
        return urls.get(index);
    }

}
