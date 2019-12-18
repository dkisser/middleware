package org.wc.prettydog.support.logger.log4j;

import org.wc.prettydog.support.logger.Logger;

/**
 * Created by WenChen on 2019/12/11.
 */
public class Log4jLogger implements Logger {

    private org.apache.logging.log4j.Logger logger;

    public Log4jLogger(org.apache.logging.log4j.Logger logger) {
        this.logger = logger;
    }

    @Override
    public void info(String s) {
        logger.info(s);
    }

    @Override
    public void info(Throwable t) {
        logger.info(t.getMessage(),t);
    }

    @Override
    public void info(String s, Throwable t) {
        logger.info(s,t);
    }

    @Override
    public void info(String s, Object... obj) {
        logger.info(s,obj);
    }

    @Override
    public void debug(String s) {
        logger.debug(s);
    }

    @Override
    public void debug(Throwable t) {
        logger.debug(t.getMessage(),t);
    }

    @Override
    public void debug(String s, Throwable t) {
        logger.debug(s,t);
    }

    @Override
    public void debug(String s, Object... obj) {
        logger.debug(s,obj);
    }

    @Override
    public void warn(String s) {
        logger.warn(s);
    }

    @Override
    public void warn(Throwable t) {
        logger.warn(t.getMessage(),t);
    }

    @Override
    public void warn(String s, Throwable t) {
        logger.warn(s,t);
    }

    @Override
    public void warn(String s, Object... obj) {
        logger.warn(s,obj);
    }

    @Override
    public void error(String s) {
        logger.error(s);
    }

    @Override
    public void error(Throwable t) {
        logger.error(t.getMessage(),t);
    }

    @Override
    public void error(String s, Throwable t) {
        logger.error(s,t);
    }

    @Override
    public void error(String s, Object... obj) {
        logger.error(s,obj);
    }

    @Override
    public void trace(String s) {
        logger.trace(s);
    }

    @Override
    public void trace(Throwable t) {
        logger.trace(t.getMessage(),t);
    }

    @Override
    public void trace(String s, Throwable t) {
        logger.trace(s,t);
    }

    @Override
    public void trace(String s, Object... obj) {
        logger.trace(s,obj);
    }

    @Override
    public boolean isTraceEnable() {
        return logger.isTraceEnabled();
    }

    @Override
    public boolean isDebugEnable() {
        return logger.isDebugEnabled();
    }

    @Override
    public boolean isWarnEnable() {
        return logger.isWarnEnabled();
    }

    @Override
    public boolean isInfoEnable() {
        return logger.isInfoEnabled();
    }

    @Override
    public boolean isErrorEnable() {
        return logger.isErrorEnabled();
    }
}
