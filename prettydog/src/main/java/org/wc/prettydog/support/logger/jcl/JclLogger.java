package org.wc.prettydog.support.logger.jcl;

import org.apache.commons.logging.Log;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.util.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by WenChen on 2019/12/11.
 */
public class JclLogger implements Logger {

    private Log logger;

    public JclLogger(Log logger) {
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
        logger.info(StringUtils.parsePlaceHolder(s,PLACEHOLDER,obj));
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
        logger.debug(StringUtils.parsePlaceHolder(s,PLACEHOLDER,obj));
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
        logger.warn(StringUtils.parsePlaceHolder(s,PLACEHOLDER,obj));
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
        logger.error(StringUtils.parsePlaceHolder(s,PLACEHOLDER,obj));
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
        logger.trace(StringUtils.parsePlaceHolder(s,PLACEHOLDER,obj));
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
