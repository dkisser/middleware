package org.wc.webserver.protocol;

import org.wc.prettydog.annotation.SPI;
import org.wc.webserver.support.ServerModule;

/**
 * Created by WenChen on 2019/12/26.
 */
@SPI
public interface Protocol {

    void export(ServerModule module);

    void unexport(int port);

}
