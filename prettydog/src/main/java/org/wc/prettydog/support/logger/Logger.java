package org.wc.prettydog.support.logger;

/**
 * Created by WenChen on 2019/12/11.
 */
public interface Logger {

    static final String PLACEHOLDER = "{}";

    void info(String s);

    void info(Throwable t);

    void info(String s,Throwable t);

    void info(String s,Object... obj);

    void debug(String s);

    void debug(Throwable t);

    void debug(String s,Throwable t);

    void debug(String s,Object... obj);

    void warn(String s);

    void warn(Throwable t);

    void warn(String s,Throwable t);

    void warn(String s,Object... obj);

    void error(String s);

    void error(Throwable t);

    void error(String s,Throwable t);

    void error(String s,Object... obj);

    void trace(String s);

    void trace(Throwable t);

    void trace(String s,Throwable t);

    void trace(String s,Object... obj);

    boolean isTraceEnable();

    boolean isDebugEnable();

    boolean isWarnEnable();

    boolean isInfoEnable();

    boolean isErrorEnable();

}
