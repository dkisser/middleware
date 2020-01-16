package org.wc.tinycat.server;

import org.wc.webserver.protocol.tcp.TcpHandler;

/**
 * Created by WenChen on 2020/1/3.
 */
public class DefaultTcpHandler implements TcpHandler{

    @Override
    public byte[] handler(byte[] request) {
        return request;
    }
}
