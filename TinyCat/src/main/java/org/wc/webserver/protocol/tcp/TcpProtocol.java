package org.wc.webserver.protocol.tcp;

import org.wc.webserver.protocol.AbstractProtocol;
import org.wc.webserver.protocol.Server;
import org.wc.webserver.support.ServerModule;

/**
 * Created by WenChen on 2019/12/30.
 */
public class TcpProtocol extends AbstractProtocol {

    @Override
    public Server exportForModule(ServerModule module) {
        throw new UnsupportedOperationException("Unsupport tcp server export");
    }
}
