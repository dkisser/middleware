package org.wc.webserver.protocol.http;

import org.wc.webserver.protocol.Server;

/**
 * Created by WenChen on 2019/12/26.
 */
public interface HttpServer extends Server {

    HttpHandler getHandler();
}
