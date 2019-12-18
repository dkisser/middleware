package org.wc.prettydog.support.logger.log4j;

import org.apache.logging.log4j.LogManager;
import org.wc.prettydog.support.logger.Level;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerAdapter;

/**
 * Created by WenChen on 2019/12/11.
 */
public class Log4jLoggerAdapter implements LoggerAdapter {

    @Override
    public Logger getLogger(Class<?> clazz) {
        return new Log4jLogger(LogManager.getLogger(clazz));
    }

    @Override
    public Logger getLogger(String name) {
        return new Log4jLogger(LogManager.getLogger(name));
    }

    @Override
    public Level getLevel() {
        throw new UnsupportedOperationException();
    }

    @Override
    public void setLevel(Level level) {
        throw new UnsupportedOperationException();
    }

}
