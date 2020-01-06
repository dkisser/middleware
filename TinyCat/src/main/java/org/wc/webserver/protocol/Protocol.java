package org.wc.webserver.protocol;

import com.sun.deploy.net.protocol.ProtocolType;
import org.wc.prettydog.annotation.SPI;
import org.wc.webserver.support.ServerModule;
import org.wc.webserver.support.resoruce.reader.Reader;

import java.util.List;

/**
 * Created by WenChen on 2019/12/26.
 */
@SPI
public interface Protocol {

    void export(ServerModule module);

    void unexport(int port);

}
