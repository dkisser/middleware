package org.wc.webserver.support.resoruce.reader;

import org.wc.webserver.support.ServerModel;

import java.util.List;

/**
 * Created by WenChen on 2019/12/27.
 */
public interface Reader {

    String serverIp();

    List<ServerModel> parse();
}
