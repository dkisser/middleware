package org.wc.prettydog.support.logger;

/**
 * Created by WenChen on 2019/12/11.
 */
public interface LoggerAdapter {

    Logger getLogger(Class<?> clazz);

    Logger getLogger(String name);

    Level getLevel();

    void setLevel(Level level);

}
