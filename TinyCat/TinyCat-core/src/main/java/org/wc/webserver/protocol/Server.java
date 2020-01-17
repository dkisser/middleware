package org.wc.webserver.protocol;

/**
 * Created by WenChen on 2019/12/27.
 */
public interface Server {

    boolean isClosed();

    void close();

}
