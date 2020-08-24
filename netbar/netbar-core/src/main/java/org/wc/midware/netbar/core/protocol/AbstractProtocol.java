package org.wc.midware.netbar.core.protocol;

import org.wc.midware.netbar.api.Exporter;
import org.wc.midware.netbar.api.Invoker;
import org.wc.midware.netbar.api.Protocol;
import org.wc.midware.netbar.api.URL;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/8/13.
 */
public abstract class AbstractProtocol implements Protocol{

    private static Map<String,Exporter> exporters = new ConcurrentHashMap<>(16);

    private static Map<String,URL> urls = new ConcurrentHashMap<>(16);

    //client invoker
    private static Set<Invoker> invokers = new HashSet<>();

    private Object DESTROY_LOCK = new Object();

    protected void registExporter (String key,Exporter exporter){
        exporters.putIfAbsent(key,exporter);
    }

    protected void registUrl(String key,URL url){
        urls.putIfAbsent(key,url);
    }

    protected void registInvokers(Invoker invoker){
        invokers.add(invoker);
    }

    public static URL getURL(String key){
        return urls.get(key);
    }

    @Override
    public void distroy() {
        synchronized (DESTROY_LOCK){
            invokers.forEach(invoker->{
                invoker.destroy();
            });
            exporters.forEach((k,v)->{
                v.unexport();
            });
        }
    }
}
