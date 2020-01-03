package org.wc.webserver.protocol.tcp;

import org.wc.prettydog.annotation.SPI;

/**
 * Created by WenChen on 2020/1/2.
 */

public interface TcpHandler {

    byte[] handler(byte[] request);
}
