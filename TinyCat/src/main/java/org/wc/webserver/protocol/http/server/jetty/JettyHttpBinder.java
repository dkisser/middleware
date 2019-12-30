package org.wc.webserver.protocol.http.server.jetty;

import org.wc.webserver.protocol.http.HttpBinder;
import org.wc.webserver.protocol.http.HttpHandler;
import org.wc.webserver.protocol.http.HttpServer;
import org.wc.webserver.support.ServerModule;

/**
 * Created by WenChen on 2019/12/30.
 */
public class JettyHttpBinder implements HttpBinder {
    @Override
    public HttpServer bind(ServerModule module,HttpHandler hander) {
        return new JettyHttpServer(module,hander);
    }
}
