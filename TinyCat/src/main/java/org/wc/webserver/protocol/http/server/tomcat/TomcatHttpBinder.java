package org.wc.webserver.protocol.http.server.tomcat;

import org.wc.webserver.protocol.http.HttpBinder;
import org.wc.webserver.protocol.http.HttpHandler;
import org.wc.webserver.protocol.http.HttpServer;

/**
 * Created by WenChen on 2019/12/26.
 */
public class TomcatHttpBinder implements HttpBinder {
    @Override
    public HttpServer bind(HttpHandler handler) {
        return new TomcatHttpServer(handler);
    }
}
