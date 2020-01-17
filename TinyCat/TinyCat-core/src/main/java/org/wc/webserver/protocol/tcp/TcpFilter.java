package org.wc.webserver.protocol.tcp;

import org.wc.webserver.support.RequestResponseModel;

/**
 * Created by WenChen on 2020/1/16.
 */
public interface TcpFilter {

    byte[] filter(byte[] req, TcpHandler handler);

}
