package org.wc.webserver.protocol;

import org.wc.webserver.support.ServerModel;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2019/12/27.
 */
public abstract class AbstractProtocol implements Protocol{

    private static Map<Integer,Server> serversMap = new ConcurrentHashMap<>();

    @Override
    public void export(ServerModel module) {
        Server server = exportForModule(module);
        serversMap.put(module.getPort(),server);
    }

    @Override
    public void unexport(int port) {
        Server server = serversMap.remove(port);
        if (server == null){
            throw new IllegalStateException("port not export,please check again");
        }
        server.close();
    }

    public abstract Server exportForModule (ServerModel module);
}
