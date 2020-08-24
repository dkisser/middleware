package org.wc.midware.netbar.core;

import org.wc.midware.netbar.api.Invocation;
import org.wc.midware.netbar.api.Invoker;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.api.cluster.Loadbalance;
import org.wc.midware.netbar.api.remote.Client;
import org.wc.midware.netbar.api.remote.Result;
import org.wc.prettydog.support.ExtensionLoader;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/8/21.
 */
public abstract class AbstractClientInvoker implements Invoker{

    private static Map<String,Client> clients = new ConcurrentHashMap<>();

    public AbstractClientInvoker() {

    }

    private Client getOrCreateClient(URL url){
        String serviceKey = url.getProviderInfo();
        Client client = clients.get(serviceKey);
        if (client == null){
            clients.putIfAbsent(serviceKey,createClient(url));
            client = clients.get(serviceKey);
        }
        return client;
    }

    @Override
    public Result invoke(Invocation invocation) {
        URL url = invocation.getUrl();
        Client client = getOrCreateClient(url);
        return client.request(invocation);
    }

    //若是zookeeper中的节点没有及时删掉在这里就会尝试去连接一个不存在的服务器，会抛出异常，此时需要返回false
    @Override
    public boolean isAvaliable(URL url) {
        try {
            Client client = getOrCreateClient(url);
            if (client != null){
                return client.isAvaliable();
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }

    public abstract Client createClient(URL url);
}
