package org.wc.webserver.protocol;

import org.wc.prettydog.support.ExtensionLoader;
import org.wc.webserver.protocol.http.HttpBinder;
import org.wc.webserver.support.ConfigurationTools;
import org.wc.webserver.support.ServerModule;
import org.wc.webserver.support.resoruce.reader.Reader;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2019/12/27.
 */
public abstract class AbstractProtocol implements Protocol{

    private static Map<Integer,Server> serversMap = new ConcurrentHashMap<>();

    @Override
    public void export(ServerModule module) {
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
        ;
    }

    public abstract Server exportForModule (ServerModule module);
}
