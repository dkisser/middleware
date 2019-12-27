package org.wc.webserver;

import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;

import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Server start module
 * Created by WenChen on 2019/12/26.
 */
public class BootStrapMain {

    private static Logger logger = LoggerFactory.getLogger(BootStrapMain.class);

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
        //mapping uri to servlet
        //open socket server
        //set socket resolver

    }

    public static void stop(){
        //check flag
        //stop server
    }
}
