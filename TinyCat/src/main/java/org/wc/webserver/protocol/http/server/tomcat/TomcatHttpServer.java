package org.wc.webserver.protocol.http.server.tomcat;

import org.apache.catalina.Context;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.startup.Tomcat;
import org.apache.tomcat.util.descriptor.web.FilterDef;
import org.apache.tomcat.util.descriptor.web.FilterMap;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.webserver.conf.Constants;
import org.wc.webserver.protocol.http.AbstractHttpServer;
import org.wc.webserver.protocol.http.HttpHandler;
import org.wc.webserver.protocol.http.servlet.DispatcherServlet;
import org.wc.webserver.protocol.http.servlet.ServletManager;
import org.wc.webserver.support.ConfigurationTools;
import org.wc.webserver.support.ServerModule;
import org.wc.webserver.utils.NetUtils;

import java.io.File;
import java.util.List;

/**
 * Created by WenChen on 2019/12/26.
 */
public class TomcatHttpServer extends AbstractHttpServer {

    private static final Logger logger = LoggerFactory.getLogger(TomcatHttpServer.class);

    private Tomcat tomcat;

    private ServerModule module;

    public TomcatHttpServer(ServerModule module, HttpHandler handler) {
        super(handler);
        this.module = module;
        DispatcherServlet.addHandler(module.getPort(), handler);
        String baseDir = new File(System.getProperty("java.io.tmpdir")).getAbsolutePath();
        tomcat = new Tomcat();
        tomcat.setBaseDir(baseDir);
        tomcat.setPort(module.getPort());
        tomcat.getConnector().setProperty("maxThreads",module.getMaxThreads());
        tomcat.getConnector().setProperty("maxConnections", module.getMaxConnections());
        tomcat.getConnector().setProperty("URIEncoding", "UTF-8");
        tomcat.getConnector().setProperty("connectionTimeout", module.getConnectTimeOut());
        tomcat.getConnector().setProperty("maxKeepAliveRequests", "-1");
        Context context = tomcat.addContext("/",baseDir);
        setFilter(module,context);
        Tomcat.addServlet(context,"dispatcher",new DispatcherServlet());
        context.addServletMappingDecoded("/*", "dispatcher");
        ServletManager.getInstance().addServletContext(module.getPort(), context.getServletContext());
        try {
            tomcat.start();
        } catch (LifecycleException e) {
            throw new IllegalStateException("Failed to start tomcat server at " + NetUtils.getServerIp() + ":" +
                    module.getPort(),
                    e);
        }
    }

    @Override
    public void close() {
        super.close();
        ServletManager.getInstance().removeServletContext(module.getPort());
        try {
            tomcat.stop();
        } catch (LifecycleException e) {
            logger.warn(e.getMessage(),e);
        }
    }

    private void setFilter (ServerModule module,Context context){
        List<ServerModule.AcceptorFilter> filters = module.getFilters();
        for (ServerModule.AcceptorFilter filter:filters){
            FilterDef filterDef = new FilterDef();
            filterDef.setFilterName(filter.getName());
            filterDef.setFilterClass(filter.getRef());
            context.addFilterDef(filterDef);
            FilterMap map =new FilterMap();
            map.setFilterName(filter.getName());
            map.setDispatcher("dispatcher");
            map.addURLPatternDecoded(filter.getUrlPattern());
            context.addFilterMap(map);
        }
    }
}
