package org.wc.midware.netbar.core.client;

import io.netty.channel.Channel;
import org.wc.midware.netbar.api.Invocation;
import org.wc.midware.netbar.api.remote.Client;
import org.wc.midware.netbar.api.remote.Result;

import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/8/7.
 */
public abstract class AbstractCachableClient implements Client {

    private static ConcurrentHashMap<String,Channel> channels = new ConcurrentHashMap<>(16);

    @Override
    public Result request(Invocation invocation) {
        return null;
    }

}
