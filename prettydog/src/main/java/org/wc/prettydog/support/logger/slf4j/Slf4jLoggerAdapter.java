package org.wc.prettydog.support.logger.slf4j;

import org.slf4j.LoggerFactory;
import org.wc.prettydog.support.logger.Level;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerAdapter;

/**
 * Created by WenChen on 2019/12/11.
 */
public class Slf4jLoggerAdapter implements LoggerAdapter {

    @Override
    public Logger getLogger(Class<?> clazz) {
        return new Slf4jLogger(LoggerFactory.getLogger(clazz));
    }

    @Override
    public Logger getLogger(String name) {
        return new Slf4jLogger(LoggerFactory.getLogger(name));
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
