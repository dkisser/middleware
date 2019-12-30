package org.wc.webserver.protocol;

import org.wc.webserver.support.ServerModule;

/**
 * Created by WenChen on 2019/12/27.
 */
public interface Server {

    boolean isClosed();

    void close();

}
