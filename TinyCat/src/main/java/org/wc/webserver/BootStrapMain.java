package org.wc.webserver;

import org.wc.prettydog.support.ExtensionLoader;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.webserver.conf.Constants;
import org.wc.webserver.protocol.Protocol;
import org.wc.webserver.support.ConfigurationTools;
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

    //TODO adapt other resources eg: yml 、 properties
    private static Reader loadResources (){
        String serverFile = ConfigurationTools.getString(Constants.DEFAULT_IN_SERVER_KEY,Constants
                .DEFAULT_IN_SEREVER_VALUE);
        ClassPathXmlReader reader = new ClassPathXmlReader(serverFile);
        return reader;
    }

    private static void startServers (Reader reader){
        List<ServerModule> modules = reader.parse();
        moduleList = modules;
        for (ServerModule module:modules){
            Protocol protocol = ExtensionLoader.getExtensionLoader(Protocol.class)
                    .getExtensionById(module.getProtocolType().getValue());
            if(protocol == null){
                throw new UnsupportedOperationException(module.getProtocolType()
                        .getValue()+ " protocol not support");
            }
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

}
