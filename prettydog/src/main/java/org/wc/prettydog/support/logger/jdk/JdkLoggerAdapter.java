package org.wc.prettydog.support.logger.jdk;

import org.wc.prettydog.support.logger.Level;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerAdapter;

import java.util.logging.LogManager;

/**
 * Created by WenChen on 2019/12/11.
 */
public class JdkLoggerAdapter implements LoggerAdapter {
    @Override
    public Logger getLogger(Class<?> clazz) {
        return new JdkLogger(java.util.logging.Logger.getLogger(clazz.getName()));
    }

    @Override
    public Logger getLogger(String name) {
        return new JdkLogger(java.util.logging.Logger.getLogger(name));
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
