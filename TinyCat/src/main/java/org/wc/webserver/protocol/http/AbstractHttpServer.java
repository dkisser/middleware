package org.wc.webserver.protocol.http;

/**
 * Created by WenChen on 2019/12/30.
 */
public abstract class AbstractHttpServer implements HttpServer{

    private volatile boolean closed;

    private HttpHandler httpHandler;

    public AbstractHttpServer(HttpHandler httpHandler) {
        if (httpHandler == null){
            throw new IllegalArgumentException("handler can't be null");
        }
        this.httpHandler = httpHandler;
    }

    @Override
    public boolean isClosed() {
        return true;
    }

    @Override
    public void close() {
        closed = true;
    }

    @Override
    public HttpHandler getHandler() {
        return httpHandler;
    }
}
