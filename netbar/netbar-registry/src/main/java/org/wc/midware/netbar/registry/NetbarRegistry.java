package org.wc.midware.netbar.registry;

import org.wc.midware.netbar.api.RPCHandler;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/8/12.
 */
public class NetbarRegistry {

    private static Map<String,RPCHandler> rpcHandlers = new ConcurrentHashMap<>(16);

    public static RPCHandler getHandler(String key){
        RPCHandler handler = rpcHandlers.get(key);
        if (handler == null){
            throw new RuntimeException("can't find RPCHandler with key:"+key);
        }
        return handler;
    }

}
