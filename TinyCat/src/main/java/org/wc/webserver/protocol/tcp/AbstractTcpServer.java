package org.wc.webserver.protocol.tcp;

/**
 * Created by WenChen on 2020/1/2.
 */
public class AbstractTcpServer implements TcpServer {

    private volatile boolean closed = false;

    private TcpHandler handler;

    public AbstractTcpServer(TcpHandler handler) {
        this.handler = handler;
    }

    @Override
    public boolean isClosed() {
        return closed;
    }

    @Override
    public void close() {
        closed = true;
    }

    @Override
    public TcpHandler getHandler() {
        return handler;
    }
}
