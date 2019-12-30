package org.wc.webserver;

import org.wc.prettydog.support.ExtensionLoader;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.webserver.conf.Constants;
import org.wc.webserver.protocol.Protocol;
import org.wc.webserver.support.ServerModule;
import org.wc.webserver.support.resoruce.reader.ClassPathXmlReader;
import org.wc.webserver.support.resoruce.reader.Reader;

import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Server start module
 * Created by WenChen on 2019/12/26.
 */
public class BootStrapMain {

    private static Logger logger = LoggerFactory.getLogger(BootStrapMain.class);

    private static final String SERVER_PROPERTIES = "server.xml";

    private static List<ServerModule> moduleList;

    //server start flag
    private static AtomicBoolean isStart = new AtomicBoolean(false);

    public static void start(){
        //check flag
        boolean f = isStart.compareAndSet(false,true);
        if (!f){
            logger.error("Server already started");
            return ;
        }
        //load servlet and filter by protocol
        Reader reader = loadResources();
        //open socket server
        startServers(reader);

    }

    private static Reader loadResources (){
        ClassPathXmlReader reader = new ClassPathXmlReader(SERVER_PROPERTIES);
//        List<ServerModule> module = reader.parse();
        return reader;
    }

    private static void startServers (Reader reader){
        List<ServerModule> modules = reader.parse();
        moduleList = modules;
        for (ServerModule module:modules){
            Protocol protocol = ExtensionLoader.getExtensionLoader(Protocol.class)
                    .getExtensionById(module.getProtocolType().getValue());
            protocol.export(module);
        }
    }
    public static void stop(){
        //check flag
        if (false == isStart.get()){
            throw new IllegalStateException("server not start,please start first");
        }
        boolean f = isStart.compareAndSet(true,false);
        //stop server
        for (ServerModule module:moduleList){
            Protocol protocol = ExtensionLoader.getExtensionLoader(Protocol.class)
                    .getExtensionById(module.getProtocolType().getValue());
            protocol.unexport(module.getPort());
        }
    }

    public static void main(String[] args) {
        start();
        try {
            Thread.sleep(1000L*60*1);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        stop();
    }
}
