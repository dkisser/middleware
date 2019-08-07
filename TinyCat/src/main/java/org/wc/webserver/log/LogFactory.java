package org.wc.webserver.log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.util.Random;

/**
 * Created by WenChen on 2019/6/4.
 */
public class LogFactory {

    public static Logger getDefaultLogger (){
        return LoggerFactory.getLogger("default");
    }

    public static Logger getBusiLogger (){
        return LoggerFactory.getLogger("busi");
    }

    public static Logger getRootLogger (){
        return LoggerFactory.getLogger("rootLogger");
    }

}
