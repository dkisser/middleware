package org.wc.webserver.support;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by WenChen on 2019/12/27.
 */
public class ServerModule {

    private int port;

    private String protocolType;

    private Map<String,String> attributes = new HashMap<>();

    private List<AcceptorFilter> filters;

    private AcceptorHandler handler;

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public String getProtocolType() {
        return protocolType;
    }

    public void setProtocolType(String protocolType) {
        this.protocolType = protocolType;
    }

    public List<AcceptorFilter> getFilters() {
        return filters;
    }

    public void setFilters(List<AcceptorFilter> filters) {
        this.filters = filters;
    }

    public AcceptorHandler getHandler() {
        return handler;
    }

    public void setHandler(AcceptorHandler handler) {
        this.handler = handler;
    }

    public void addAttributes(String key,String value) {
        this.attributes.put(key,value);
    }

    public String getAttributes(String key,String defaultVal){
        String val = this.attributes.get(key);
        if (val == null){
            val = defaultVal;
        }
        return val;
    }

    public static class AcceptorHandler{

        private String ref;

        public String getRef() {
            return ref;
        }

        public void setRef(String ref) {
            this.ref = ref;
        }
    }

    public static class AcceptorFilter{

        private String ref;

        private String urlPattern;

        private String name;

        public String getRef() {
            return ref;
        }

        public void setRef(String ref) {
            this.ref = ref;
        }

        public String getUrlPattern() {
            return urlPattern;
        }

        public void setUrlPattern(String urlPattern) {
            this.urlPattern = urlPattern;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }
}
