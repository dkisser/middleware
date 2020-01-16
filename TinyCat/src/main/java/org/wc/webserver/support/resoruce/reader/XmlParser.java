package org.wc.webserver.support.resoruce.reader;

import org.wc.prettydog.annotation.SPI;
import org.wc.webserver.support.ServerModule;
import org.wc.webserver.support.resoruce.Resource;

import java.io.File;
import java.util.List;

/**
 * Created by WenChen on 2019/12/27.
 */
@SPI("dom")
public interface XmlParser {

    List<ServerModule> parseResource (Resource resource);

    List<ServerModule> parseFile(File file);

}
