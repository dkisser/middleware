package org.wc.midware.netbar.core;

import org.wc.midware.netbar.api.Reference;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.core.config.ReferenceConfigBean;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/8/24.
 */
public class RPCInvoker {

    private static Map<String,Reference> referenceMap = new ConcurrentHashMap<>();

    private String serviceId;

    private String group;

    private String version;

    public RPCInvoker(String serviceId, String group, String version) {
        this.serviceId = serviceId;
        this.group = group;
        this.version = version;
    }

    private URL buildUrl (){
        URL url = new URL();
        url.setIp("0.0.0.0").setPort(1).setProtocol("netbar")
                .setServiceId(serviceId).setGroup(group)
                .setVersion(version).setImpl("default");
        return url;
    }

    public Map<String,Object> invoke(Map<String,Object> req){
        URL url = buildUrl();
        String serviceKey = url.getConsumerInfo();
        Reference reference = referenceMap.get(serviceKey);
        if (reference == null){
            referenceMap.putIfAbsent(serviceKey,new ReferenceConfigBean(url));
            reference = referenceMap.get(serviceKey);
        }
        return reference.refer(req);
    }
}
