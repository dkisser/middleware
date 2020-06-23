package org.wc.prettydog.mselect.registry;

import org.wc.prettydog.mselect.URL;
import org.wc.prettydog.mselect.transporter.ZookeeperClient;
import org.wc.prettydog.mselect.transporter.ZookeeperListener;
import org.wc.prettydog.support.ExtensionLoader;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.NavigableSet;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;

/**
 * TODO need retry connect zookeeper，sometime zookeeper connection may broke;
 *
 * Created by WenChen on 2020/6/19.
 */
public class PrettyRegistry extends AbstractRegistry {

    private static final Logger logger = LoggerFactory.getLogger(PrettyRegistry.class);

    private TreeSet<Service> svc;

    private ZookeeperClient client;

    //key:group , value:master in group
    private static ConcurrentHashMap<String,URL> masters;

    //key:registpath(no encode) value:encoded path
    private static ConcurrentHashMap<String,String> subMap;

    public PrettyRegistry() {
        this.svc = new TreeSet<>();
        this.masters = new ConcurrentHashMap<>();
        this.subMap = new ConcurrentHashMap<>();
        this.client = ExtensionLoader.getExtensionLoader(ZookeeperClient.class)
//                        .getExtensionById("");
                        .getDefaultExtension();
    }

    private String getServiceKey (URL url) throws UnsupportedEncodingException {
        return url.getIdentifyStr();
    }

    private String getEncodeServiceKey (String url) throws UnsupportedEncodingException{
        return URLEncoder.encode(url,"UTF-8");
    }

    private String getDecodeServiceKey (String url) throws UnsupportedEncodingException{
        return URLDecoder.decode(url,"UTF-8");
    }

    private String getEncodeListServiceKey (URL url) throws UnsupportedEncodingException {
        return url.getListPath()+getEncodeServiceKey(url.getIdentifyStr());
    }

    private String getEncodeMasterServiceKey (URL url) throws UnsupportedEncodingException {
        return url.getMasterPath()+getEncodeServiceKey(url.getIdentifyStr());
    }

    public void subscribe(URL url) throws Exception {
        //create sequence ephemeral path
        String serviceKey = getServiceKey(url);
        String encodeServiceKey = getEncodeServiceKey(serviceKey);
        String cretedPath = client.createEphemeralSequence(url.getListPath()+encodeServiceKey+"-");
        String sequence = cretedPath.split("-")[1];
        Service current = new Service(serviceKey,sequence);
        refreshSvcList(url);
        //subscribe before path.if none path front ,mark master
        NavigableSet<Service> ngs = svc.tailSet(current,false);
        doSubscribe(ngs,current,url);
        //TODO need to remove unuserd path
        subMap.put(getEncodeListServiceKey(url),cretedPath);
    }

    public void unsubscribe(URL url) throws Exception {
        String encodePath = getEncodeListServiceKey(url);
        String registPath = subMap.get(encodePath);
        String[] arr = registPath.split("-");
        Service service = new Service(getDecodeServiceKey(arr[0]),arr[1]);
        svc.remove(service);
        super.unsubscribe(encodePath);
        client.delete(registPath);
        URL masterUrl = masters.get(url.getGroup());
        if (masterUrl.equals(url)){
            client.delete(getEncodeMasterServiceKey(url));
            System.out.println("delete :"+ getEncodeMasterServiceKey(url));
        }
    }

    private ZookeeperListener getMasterListener(){
        return list -> {
            try {
                if (list != null &&list.size() > 0){
                    synchronized (masters){
                        for (String path:list){
                            String serviceKey = getDecodeServiceKey(path);
                            URL url = URL.valueOf(serviceKey);
                            masters.put(url.getGroup(),url);
                        }
                        System.out.println(masters);
                    }
                }
            } catch (Exception e){
                logger.error(e);
            }
        };
    }

    private void refreshSvcList (URL url) throws Exception{
        String listPath = url.getListPath();
        int length = listPath.length();
        listPath = listPath.substring(0,length-1);
        List<String> pathList = client.select(listPath);
        for (String path:pathList){
            String[] arr =  path.split("-");
            svc.add(new Service(getDecodeServiceKey(arr[0]),arr[1]));
        }
    }

    private ZookeeperListener getListListener(Service service,URL u){
        return list -> {
            TreeSet<Service> newsvc = new TreeSet<>();
            try {
                for (String path:list){
                    String[] arr =  path.split("-");
                    String serviceKey = getDecodeServiceKey(arr[0]);
                    String sequence = arr[1];
                    newsvc.add(new Service(serviceKey,sequence));
                }
                NavigableSet<Service> ngs = newsvc.tailSet(service,false);
                doSubscribe(ngs,service,u);
                svc = newsvc;
            } catch (Exception e) {
                logger.error(e);
            }
        };
    }

    private void doSubscribe(NavigableSet<Service> ngs,Service service,URL u) throws Exception{
        if (ngs.size() > 0){
            int length = u.getMasterPath().length()-1;
            String masterPath = u.getMasterPath().substring(0,length);
            Service front = ngs.first();
            URL a = URL.valueOf(front.getServiceKey());
            ZookeeperListener listener = getListListener(service,u);
            String encodePath = getEncodeListServiceKey(a);
            String registListPath = encodePath+"-"+front.getSequence();
            super.subscribe(encodePath, listener);
            client.addListener(registListPath,listener);
            client.addListener(masterPath,getMasterListener());
        } else {
            masters.put(u.getGroup(),u);
            client.create(getEncodeMasterServiceKey(u),true);
            System.out.println(masters);
        }
    }

    private class Service implements Comparable<Service>{

        private String serviceKey;

        private String sequence;

        public String getServiceKey() {
            return serviceKey;
        }

        public Service setServiceKey(String serviceKey) {
            this.serviceKey = serviceKey;
            return this;
        }

        public String getSequence() {
            return sequence;
        }

        public Service setSequence(String sequence) {
            this.sequence = sequence;
            return this;
        }

        public Service(String serviceKey, String sequence) {
            this.serviceKey = serviceKey;
            this.sequence = sequence;
        }

        private BigDecimal getBigDecimal(String sequence){
            return new BigDecimal(sequence);
        }

        @Override
        public int compareTo(Service o) {
            BigDecimal _this = getBigDecimal(sequence);
            BigDecimal _other = getBigDecimal(o.getSequence());
            int result = _this.compareTo(_other);
            return result == 0 ? 0 : -result;
        }
    }
}
