package org.wc.webserver.conf;

/**
 * Created by WenChen on 2019/12/30.
 */
public class Constants {

    public static final String DEFAULT_HTTP_SERVER_KEY = "tinycat.http.server";

    public static final String DEFAULT_HTTP_SERVER_VALUE = "jetty";

    public static final String DEFAULT_PROPERTIES_KEY = "tinycat.file";

    public static final String DEFAULT_PROPERTIES_VALUE = "TinyCat.properties";

    public static final String DEFAULT_IN_SERVER_KEY = "tinycat.access.file";

    public static final String DEFAULT_IN_SEREVER_VALUE = "server.xml";

    public static final String DEFAULT_HTTP_MAX_THREADS_KEY = "maxThreads";

    public static final int DEFAULT_HTTP_MAX_THREADS_VALUE = 200;

    public static final String DEFAULT_HTTP_MAX_CONNECTIONS_KEY = "maxConnections";

    public static final String DEFULT_HTTP_MAX_CONNECTIONS_VALUE = "20";

    public static final String DEFAULT_HTTP_TIMEOUT_KEY = "sessionTimeOut";

    public static final int DEFAULT_HTTP_TIMEOUT_VALUE = 60000;

    public static final String DEFAULT_ENCODING = "UTF-8";

    public static final String DEFAULT_TCP_SERVER_KEY = "tinycat.tcp.server";

    public static final String DEFAULT_TCP_SERVER_VALUE = "netty";

    public static final int DEFAULT_IO_THREADS = Math.min(Runtime.getRuntime().availableProcessors() + 1, 32);
}
