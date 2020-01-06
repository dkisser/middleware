package org.wc.webserver.support;

import java.util.List;

/**
 * Created by WenChen on 2019/12/27.
 */
public class ServerModule {

    private int port;

    private String consoleEncoding;

    private String protocolType;

    private String maxThreads;

    private String maxConnections;

    private String connectTimeOut;

    private List<AcceptorFilter> filters;

    private AcceptorHandler handler;

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public String getConsoleEncoding() {
        return consoleEncoding;
    }

    public void setConsoleEncoding(String consoleEncoding) {
        this.consoleEncoding = consoleEncoding;
    }

    public String getProtocolType() {
        return protocolType;
    }

    public void setProtocolType(String protocolType) {
        this.protocolType = protocolType;
    }

    public String getMaxThreads() {
        return maxThreads;
    }

    public void setMaxThreads(String maxThreads) {
        this.maxThreads = maxThreads;
    }

    public String getMaxConnections() {
        return maxConnections;
    }

    public void setMaxConnections(String maxConnections) {
        this.maxConnections = maxConnections;
    }

    public String getConnectTimeOut() {
        return connectTimeOut;
    }

    public void setConnectTimeOut(String connectTimeOut) {
        this.connectTimeOut = connectTimeOut;
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
