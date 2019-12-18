package org.wc.prettydog.support.logger;

import org.wc.prettydog.support.logger.jcl.JclLoggerAdapter;
import org.wc.prettydog.support.logger.jdk.JdkLoggerAdapter;
import org.wc.prettydog.support.logger.log4j.Log4jLoggerAdapter;
import org.wc.prettydog.support.logger.slf4j.Slf4jLoggerAdapter;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2019/12/11.
 */
public class LoggerFactory {

    private static ConcurrentHashMap<String,Logger> LOGGERS = new ConcurrentHashMap<>();

    private static volatile LoggerAdapter LOGGER_ADAPTER;

    private LoggerFactory(){}

    static {
        String property = System.getProperty("prettydog.application.logger");
        if ("log4j".equals(property)){
            setLoggerAdapter(new Log4jLoggerAdapter());
        } else if ("slf4j".equals(property)){
            setLoggerAdapter(new Slf4jLoggerAdapter());
        } else if ("jcl".equals(property)){
            setLoggerAdapter(new JclLoggerAdapter());
        } else if ("jdk".equals(property)){
            setLoggerAdapter(new JdkLoggerAdapter());
        } else {
            try {
                setLoggerAdapter(new Log4jLoggerAdapter());
            } catch (Throwable t){
                try {
                    setLoggerAdapter(new Slf4jLoggerAdapter());
                } catch (Throwable t1){
                    try {
                        setLoggerAdapter(new JclLoggerAdapter());
                    } catch (Throwable t2) {
                        setLoggerAdapter(new JdkLoggerAdapter());
                    }
                }
            }
        }
    }

    public static Logger getLogger(Class<?> clazz){
        String name = clazz.getName();
        return getLogger(name);
    }

    public static Logger getLogger(String name){
        Logger logger = LOGGERS.get(name);
        if (logger == null){
            logger = LOGGER_ADAPTER.getLogger(name);
            LOGGERS.putIfAbsent(name,logger);
        }
        return logger;
    }

    private static void setLoggerAdapter(LoggerAdapter adapter){
        if (adapter!=null){
            LoggerFactory.LOGGER_ADAPTER = adapter;
            Logger logger = adapter.getLogger(LoggerFactory.class);
            logger.info("Use Logger:{}",adapter.getClass().getName());
        }
    }
}
