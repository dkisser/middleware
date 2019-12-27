package org.wc.webserver.support.resoruce.reader;

import org.wc.prettydog.annotation.SPI;
import org.wc.webserver.support.ServerModule;
import org.wc.webserver.support.resoruce.Resource;

import java.io.File;

/**
 * Created by WenChen on 2019/12/27.
 */
@SPI("dom")
public interface XmlParser {

    ServerModule parseResource (Resource resource);

    ServerModule parseFile(File file);

}
