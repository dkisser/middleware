package org.wc.webserver.support.resoruce.reader;

import org.wc.prettydog.annotation.SPI;
import org.wc.webserver.support.ServerModel;
import org.wc.webserver.support.resoruce.Resource;

import java.io.File;
import java.util.List;

/**
 * Created by WenChen on 2019/12/27.
 */
@SPI("dom")
public interface XmlParser {

    List<ServerModel> parseResource (Resource resource);

    List<ServerModel> parseFile(File file);

}
