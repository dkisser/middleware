package org.wc.tinycat.protocol;

import org.wc.webserver.protocol.tcp.TcpFilter;
import org.wc.webserver.protocol.tcp.TcpHandler;

/**
 * Created by WenChen on 2020/1/16.
 */
public class TcpFilterTest implements TcpFilter {
    @Override
    public byte[] filter(byte[] req, TcpHandler handler) {
        System.out.println(1111);
        return handler.handler(req);
    }
}
