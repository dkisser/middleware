package org.wc.midware.netbar.common;

import com.alibaba.fastjson.JSONObject;
import org.wc.midware.netbar.api.Invocation;
import org.wc.midware.netbar.api.Resolver;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.api.remote.Request;
import org.wc.midware.netbar.common.remote.DefaultRequest;

import java.util.Map;

/**
 * Created by WenChen on 2020/8/13.
 */
public class JsonResolver implements Resolver {

    @Override
    public Map pack(Request request) {
        Invocation invocation = request.getInvocation();
        URL url = invocation.getUrl();
        JSONObject data = new JSONObject();
        JSONObject header = new JSONObject();
        JSONObject body = new JSONObject();
        data.put("header",header);
        data.put("body",body);
//        header.put("id",request.getRequestId());
//        header.put("serviceId",url.getServiceId());
//        header.put("group",url.getGroup());
//        header.put("version",url.getVersion());
//        header.put("impl",url.getImpl());
//        header.putAll(url.getArguments());
        header.put("urlIndentify",url.getIdentifyStr());
        header.put("id",request.getRequestId());
        body.putAll(invocation.getRequest());
        return data;
    }

    @Override
    public Request unpack(Map map) {
        JSONObject header= (JSONObject)map.get("header");
//        URL url = new URL();
        URL url = URL.valueOf(header.getString("urlIndentify"));
//        header.forEach((key,value)->{
//            if (key.equals("serviceId")){
//                url.setServiceId((String) value);
//            }
//            if (key.equals("group")){
//                url.setGroup((String) value);
//            }
//            if (key.equals("impl")){
//                url.setImpl((String) value);
//            }
//            if (key.equals("version")){
//                url.setVersion((String) value);
//            }
//            url.addArgument(key,value);
//        });
        Long requestId = header.getLong("id");
        JSONObject body = (JSONObject) map.get("body");
        DefaultInvocation invocation = new DefaultInvocation(body,url);
        DefaultRequest request = new DefaultRequest();
        request.setInvocation(invocation);
        return new DefaultRequest(requestId,invocation);
    }
}
