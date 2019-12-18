package org.wc.prettydog.support.logger.jcl;

import org.apache.commons.logging.LogFactory;
import org.wc.prettydog.support.logger.Level;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerAdapter;

/**
 * Created by WenChen on 2019/12/11.
 */
public class JclLoggerAdapter implements LoggerAdapter {
    @Override
    public Logger getLogger(Class<?> clazz) {
        return new JclLogger(LogFactory.getLog(clazz));
    }

    @Override
    public Logger getLogger(String name) {
        return new JclLogger(LogFactory.getLog(name));
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
