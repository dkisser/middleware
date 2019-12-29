package org.wc.webserver.support.resoruce.reader;

import org.wc.webserver.support.ServerModule;
import org.wc.webserver.support.resoruce.ResourceLoader;

import java.util.List;

/**
 * Created by WenChen on 2019/12/27.
 */
public interface Reader {

    String serverIp();

    List<ServerModule> parse(ResourceLoader resourceLoader, String path);
}
