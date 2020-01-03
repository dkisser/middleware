package org.wc.webserver.protocol.tcp.netty;

import org.wc.webserver.protocol.tcp.TcpBinder;
import org.wc.webserver.protocol.tcp.TcpHandler;
import org.wc.webserver.protocol.tcp.TcpServer;
import org.wc.webserver.support.ServerModule;

/**
 * Created by WenChen on 2020/1/2.
 */
public class NettyTcpBinder implements TcpBinder {

    @Override
    public TcpServer bind(ServerModule module, TcpHandler handler) {
        return new NettyTcpServer(module,handler);
    }
}
