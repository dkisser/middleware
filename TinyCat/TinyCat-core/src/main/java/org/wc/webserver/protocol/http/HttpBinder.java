package org.wc.webserver.protocol.http;

import org.wc.prettydog.annotation.SPI;
import org.wc.webserver.support.ServerModel;

/**
 * Created by WenChen on 2019/12/26.
 */
@SPI("jetty")
public interface HttpBinder {

    HttpServer bind(ServerModel module, HttpHandler hander);
}
