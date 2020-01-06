package org.wc.webserver.support.resoruce.reader;

import org.w3c.dom.Node;
import org.wc.prettydog.annotation.SPI;
import org.wc.webserver.support.ServerModule;

/**
 * Created by WenChen on 2020/1/6.
 */
@SPI
public interface ProtocolXmlParser {

    ServerModule parseByProtocol(Node node);
}
