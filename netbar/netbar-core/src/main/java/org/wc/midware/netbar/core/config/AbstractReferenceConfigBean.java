package org.wc.midware.netbar.core.config;

import com.sun.org.apache.xpath.internal.functions.FuncUnparsedEntityURI;
import org.apache.zookeeper.KeeperException;
import org.wc.midware.netbar.api.*;
import org.wc.midware.netbar.api.cluster.Loadbalance;
import org.wc.midware.netbar.common.config.AbstractConfigBean;
import org.wc.prettydog.mselect.transporter.ZookeeperListener;
import org.wc.prettydog.support.ExtensionLoader;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Created by WenChen on 2020/8/7.
 */
public abstract class AbstractReferenceConfigBean extends AbstractConfigBean implements Reference,ZookeeperListener{

    private URL url;

    private Loadbalance loadbalance;

    private Protocol protocol;

    private static Map<String,List<URL>> actives = new ConcurrentHashMap<>();

    private static Map<String,Invoker> invokers = new ConcurrentHashMap<>();

    private static Map<String,URL> consumers = new ConcurrentHashMap<>();

    private static Map<String,ZookeeperListener> listeners = new ConcurrentHashMap<>();

    private static boolean PROVIDER_INIT = false;

    private static Object REFRESH_LOCK = new Object();

    public AbstractReferenceConfigBean(URL url) {
        this.url = url;
        this.protocol = ExtensionLoader.getExtensionLoader(Protocol.class).getExtensionById("netbar");
        this.loadbalance = ExtensionLoader.getExtensionLoader(Loadbalance.class).getDefaultExtension();
//        this.loadbalance = ExtensionLoader.getExtensionLoader(Loadbalance.class).getExtensionById("round");
        loadInvoker();
        subscribeUrl();
    }

    protected abstract Loadbalance getLoadbalance();

    private void subscribeUrl(){
        String providerPath = url.getSubcribePath("provider");
        ZookeeperListener listener = listeners.get(providerPath);
        if (listener == null){
            listeners.putIfAbsent(providerPath,this);
            getZkClient().addListener(providerPath,this);
        }
    }

    private AbstractReferenceConfigBean setLoadbalance(){
        this.loadbalance = getLoadbalance();
        return this;
    }

    private void loadInvoker (){
        if (!PROVIDER_INIT){
            synchronized (REFRESH_LOCK){
                if (!PROVIDER_INIT){
                    doLoadInvoker();
                }
            }
        }

    }

    private void doLoadInvoker(){
        try {
            String serviceKey = url.getConsumerInfo();
            List<URL> urls = actives.get(serviceKey);
            if (urls == null){
                actives.putIfAbsent(serviceKey,getActive());
                urls = actives.get(serviceKey);
            }
            urls.forEach(a ->
                invokers.putIfAbsent(a.getProviderInfo(),protocol.refer())
            );
//            getRegistry().subscribe(url.getSubsctibePath("provider"),this);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            PROVIDER_INIT = true;
        }
    }

    private List<URL> findAvaliableInvokers(String serviceKey){
        List<URL> result = new ArrayList<>();
        List<URL> urls = actives.get(serviceKey);
        if (urls == null){
            return Collections.emptyList();
        }
        for (URL url:urls){
            String key = url.getProviderInfo();
            Invoker invoker = invokers.get(key);
            if (invoker != null && invoker.isAvaliable(url)){
                result.add(url);
            }
        }
        return result;
    }

    @Override
    public Map refer(Map req) {
        //init
        setLoadbalance().setRegistry().setZkClient();
        String reigistPath = url.getRegistPath("consumer");
        if (!consumers.containsKey(reigistPath)){
            try {
                getZkClient().create(reigistPath,true);
                consumers.putIfAbsent(reigistPath,url);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        try {
            String serviceKey = url.getConsumerInfo();
            //动态剔除非可用节点
            List<URL> urls = findAvaliableInvokers(serviceKey);
            if (urls.size() == 0){
                throw new IllegalStateException("No Service Provider");
            }
            URL fiUrl = loadbalance.select(urls);
//            getRegistry().subscribe(url.getSubsctibePath("provider"),this);
            Invoker invoker = invokers.get(fiUrl.getProviderInfo());
            //start client
            return invoker.invoke(new RefereceInvocation(fiUrl,req)).getValue();
        } catch (Exception e) {
            throw new IllegalStateException("no service provider");
        }
    }

    public List<URL> getActive(){
        List<URL> result = new ArrayList<>();
        try {
            String selectPath = URL.ROOT_PATH.substring(0);
            selectPath = selectPath.replace("@serviceId@",url.getServiceId());
            selectPath += "provider";
            List<String> s = getZkClient().select(selectPath);
            s.forEach(t -> result.add(URL.deCodeAndGet(t)));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void notify(List<String> paths) {
        Map<String,List<URL>> newactives = new ConcurrentHashMap<>();
        Map<String,Invoker> newInvokers = new ConcurrentHashMap<>();
        paths.forEach(s -> {
            URL u = URL.deCodeAndGet(s);
            String serviceKey = u.getConsumerInfo();
            List<URL> urls = newactives.get(serviceKey);
            if (urls == null){
                newactives.putIfAbsent(serviceKey,getActive());
                urls = newactives.get(serviceKey);
            }
            urls.forEach(a ->
                newInvokers.putIfAbsent(a.getProviderInfo(),protocol.refer())
            );
        });
        System.out.println("newactives:"+newactives);
        System.out.println("newinvokers:"+newInvokers);
        synchronized (REFRESH_LOCK){
            invokers = newInvokers;
            actives = newactives;
        }

    }

    class RefereceInvocation implements Invocation{
        private URL url;

        private Map map;

        public RefereceInvocation(URL url, Map map) {
            this.url = url;
            this.map = map;
        }

        @Override
        public Map getRequest() {
            return map;
        }

        @Override
        public URL getUrl() {
            return url;
        }
    }
}
