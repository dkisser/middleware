package org.wc.webserver.protocol;

import org.wc.webserver.support.resoruce.reader.Reader;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2019/12/27.
 */
public abstract class AbstractProtocol implements Protocol{

    private static Map<Integer,Server> serversMap = new ConcurrentHashMap<>();

    @Override
    public void export(Reader reader) {
    }

    @Override
    public void unexport(Server server) {

    }

}
