package org.wc.tinycat.protocol;

import org.wc.webserver.protocol.tcp.TcpFilter;
import org.wc.webserver.protocol.tcp.TcpHandler;

/**
 * Created by WenChen on 2020/1/16.
 */
public class TcpPingFilter implements TcpFilter {
    @Override
    public byte[] filter(byte[] req, TcpHandler handler) {
        String resStr = new String(req);
        if ("666666".equals(resStr)){
            return req;
        }
        return handler.handler(req);
    }
}
