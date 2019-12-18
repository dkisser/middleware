package org.wc.prettydog.support.logger.jdk;

import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.util.StringUtils;

import java.util.logging.Level;

/**
 * Created by WenChen on 2019/12/11.
 */
public class JdkLogger implements Logger {

    private java.util.logging.Logger logger;

    public JdkLogger(java.util.logging.Logger logger) {
        this.logger = logger;
    }

    @Override
    public void info(String s) {
        logger.log(Level.INFO,s);
    }

    @Override
    public void info(Throwable t) {
        logger.log(Level.INFO,t.getMessage(),t);
    }

    @Override
    public void info(String s, Throwable t) {
        logger.log(Level.INFO,s,t);
    }

    @Override
    public void info(String s, Object... obj) {
        logger.log(Level.INFO, StringUtils.parsePlaceHolder(s,PLACEHOLDER,obj));
    }

    @Override
    public void debug(String s) {
        logger.log(Level.FINE,s);
    }

    @Override
    public void debug(Throwable t) {
        logger.log(Level.FINE,t.getMessage(),t);
    }

    @Override
    public void debug(String s, Throwable t) {
        logger.log(Level.FINE,s,t);
    }

    @Override
    public void debug(String s, Object... obj) {
        logger.log(Level.FINE,StringUtils.parsePlaceHolder(s,PLACEHOLDER,obj));
    }

    @Override
    public void warn(String s) {
        logger.log(Level.WARNING,s);
    }

    @Override
    public void warn(Throwable t) {
        logger.log(Level.WARNING,t.getMessage(),t);
    }

    @Override
    public void warn(String s, Throwable t) {
        logger.log(Level.WARNING,s,t);
    }

    @Override
    public void warn(String s, Object... obj) {
        logger.log(Level.WARNING,StringUtils.parsePlaceHolder(s,PLACEHOLDER,obj));
    }

    @Override
    public void error(String s) {
        logger.log(Level.SEVERE,s);
    }

    @Override
    public void error(Throwable t) {
        logger.log(Level.SEVERE,t.getMessage(),t);
    }

    @Override
    public void error(String s, Throwable t) {
        logger.log(Level.SEVERE,s,t);
    }

    @Override
    public void error(String s, Object... obj) {
        logger.log(Level.SEVERE,StringUtils.parsePlaceHolder(s,PLACEHOLDER,obj));
    }

    @Override
    public void trace(String s) {
        logger.log(Level.FINER,s);
    }

    @Override
    public void trace(Throwable t) {
        logger.log(Level.FINER,t.getMessage(),t);
    }

    @Override
    public void trace(String s, Throwable t) {
        logger.log(Level.FINER,s,t);
    }

    @Override
    public void trace(String s, Object... obj) {
        logger.log(Level.FINER,StringUtils.parsePlaceHolder(s,PLACEHOLDER,obj));
    }

    @Override
    public boolean isTraceEnable() {
        return logger.isLoggable(Level.FINER);
    }

    @Override
    public boolean isDebugEnable() {
        return logger.isLoggable(Level.FINE);
    }

    @Override
    public boolean isWarnEnable() {
        return logger.isLoggable(Level.WARNING);
    }

    @Override
    public boolean isInfoEnable() {
        return logger.isLoggable(Level.INFO);
    }

    @Override
    public boolean isErrorEnable() {
        return logger.isLoggable(Level.SEVERE);
    }
}
