package org.wc.webserver.protocol.tcp;

import org.wc.webserver.protocol.Server;

/**
 * Created by WenChen on 2020/1/2.
 */
public interface TcpServer extends Server {

    TcpHandler getHandler();
}
