package org.wc.webserver.protocol.tcp;

/**
 * Created by WenChen on 2020/1/2.
 */
public class DefaultTcpHandler implements TcpHandler {
    @Override
    public byte[] handler(byte[] request) {
        return request;
    }
}
