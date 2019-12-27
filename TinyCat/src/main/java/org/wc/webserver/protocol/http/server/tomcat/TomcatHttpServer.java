package org.wc.webserver.protocol.http.server.tomcat;

import org.apache.catalina.Context;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.startup.Tomcat;
import org.springframework.web.servlet.DispatcherServlet;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.webserver.protocol.http.HttpHandler;
import org.wc.webserver.protocol.http.HttpServer;
import org.wc.webserver.support.ConfigurationTools;

import java.io.File;

/**
 * Created by WenChen on 2019/12/26.
 */
public class TomcatHttpServer implements HttpServer {

    private static final Logger logger = LoggerFactory.getLogger(TomcatHttpServer.class);

    private Tomcat tomcat;

    public TomcatHttpServer(HttpHandler handler) {
        String baseDir = new File(System.getProperty("java.io.tmpdir")).getAbsolutePath();
        tomcat = new Tomcat();
        tomcat.setBaseDir(baseDir);
        tomcat.setPort(ConfigurationTools.getInt("server.port",8080));
        tomcat.getConnector().setProperty("maxThreads",ConfigurationTools.getString("server.maxThreads","200"));
        tomcat.getConnector().setProperty("maxConnections",ConfigurationTools.getString("server.maxConnections",
                "20"));
        tomcat.getConnector().setProperty("URIEncoding", "UTF-8");
        tomcat.getConnector().setProperty("connectionTimeout", "60000");
        tomcat.getConnector().setProperty("maxKeepAliveRequests", "-1");
        Context context = tomcat.addContext("/",baseDir);
        Tomcat.addServlet(context,"dispatcher",new DispatcherServlet());
        try {
            tomcat.start();
        } catch (LifecycleException e) {
            logger.error("server start error",e);
        }
    }
}
