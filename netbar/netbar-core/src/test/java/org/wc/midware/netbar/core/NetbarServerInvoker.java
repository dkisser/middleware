package org.wc.midware.netbar.core;

import org.wc.midware.netbar.api.*;
import org.wc.midware.netbar.api.remote.Result;
import org.wc.midware.netbar.common.DefaultResult;
import org.wc.prettydog.support.ExtensionLoader;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/8/13.
 */
public class NetbarServerInvoker implements Invoker {

    private static Map<String, RPCHandler> handlers = new ConcurrentHashMap<>(16);

    private ProxyFactory proxyFactory = ExtensionLoader.getExtensionLoader(ProxyFactory.class).getDefaultExtension();

    private static volatile NetbarServerInvoker INSTTANCE;

    private NetbarServerInvoker() {}

    public static NetbarServerInvoker newInstance(){
        if (INSTTANCE == null){
            synchronized (NetbarServerInvoker.class){
                if (INSTTANCE == null){
                    INSTTANCE = new NetbarServerInvoker();
                }
            }
        }
        return INSTTANCE;
    }

    @Override
    public Result invoke(Invocation invocation) {
        Map result = null;
        Throwable t = null;
        try {
            String serviceKey = invocation.getUrl().getServiceKey();
            RPCHandler handler = handlers.get(serviceKey);
            if (handler == null) {
                handler = proxyFactory.getProxy(invocation.getUrl());
                handlers.putIfAbsent(serviceKey, handler);
            }
            result = handler.handler(invocation.getRequest());
        } catch (Throwable e) {
            t = e;
        }
        return new DefaultResult(t, result, t != null);
    }

    @Override
    public boolean isAvaliable(URL url) {
        return false;
    }

    @Override
    public void destroy() {

    }
}
