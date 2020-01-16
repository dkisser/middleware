package org.wc.webserver.protocol.tcp;

import org.wc.prettydog.annotation.SPI;
import org.wc.webserver.support.ServerModule;

/**
 * Created by WenChen on 2020/1/2.
 */
@SPI("netty")
public interface TcpBinder {

    TcpServer bind(ServerModule module,TcpHandler handler);
}
