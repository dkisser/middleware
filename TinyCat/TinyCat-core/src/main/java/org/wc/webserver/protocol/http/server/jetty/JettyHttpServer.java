package org.wc.webserver.protocol.http.server.jetty;

import org.mortbay.jetty.Server;
import org.mortbay.jetty.SessionManager;
import org.mortbay.jetty.nio.SelectChannelConnector;
import org.mortbay.jetty.servlet.Context;
import org.mortbay.jetty.servlet.FilterHolder;
import org.mortbay.jetty.servlet.ServletHandler;
import org.mortbay.jetty.servlet.ServletHolder;
import org.mortbay.log.Log;
import org.mortbay.log.StdErrLog;
import org.mortbay.thread.QueuedThreadPool;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.webserver.conf.Constants;
import org.wc.webserver.protocol.http.AbstractHttpServer;
import org.wc.webserver.protocol.http.HttpHandler;
import org.wc.webserver.protocol.http.servlet.DispatcherServlet;
import org.wc.webserver.protocol.http.servlet.ServletManager;
import org.wc.webserver.support.ServerModel;
import org.wc.webserver.utils.NetUtils;

import java.util.List;

/**
 * Created by WenChen on 2019/12/30.
 */
public class JettyHttpServer extends AbstractHttpServer {

    private static final Logger logger = LoggerFactory.getLogger(JettyHttpServer.class);

    private Server server;

    private ServerModel module;

    //TODO SET maxConnections 、keepaliveTime
    public JettyHttpServer(ServerModel module, HttpHandler handler) {
        super(handler);
        this.module = module;
        Log.setLog(new StdErrLog());
        Log.getLog().setDebugEnabled(false);
        DispatcherServlet.addHandler(module.getPort(), handler);
        String threads = module.getAttribute(Constants.DEFAULT_HTTP_MAX_THREADS_KEY,Constants
                .DEFAULT_HTTP_MAX_THREADS_VALUE+"");
        int threadNum = Integer.parseInt(threads);
        QueuedThreadPool threadPool = new QueuedThreadPool();
        threadPool.setDaemon(true);
        threadPool.setMaxThreads(threadNum);
        threadPool.setMinThreads(threadNum);

        SelectChannelConnector connector = new SelectChannelConnector();
        connector.setPort(module.getPort());

        server = new Server();
        server.setThreadPool(threadPool);
        server.addConnector(connector);

        ServletHandler servletHandler = new ServletHandler();
        ServletHolder servletHolder = servletHandler.addServletWithMapping(DispatcherServlet.class, "/*");
        servletHolder.setInitOrder(2);

        // TODO Context.SESSIONS is the best option here?
        Context context = new Context(server, "/", Context.SESSIONS);
        setFilter(module,context,servletHandler);
        context.setServletHandler(servletHandler);
        SessionManager manager = context.getSessionHandler().getSessionManager();
        String sessionTimeout = module.getAttribute(Constants.DEFAULT_HTTP_TIMEOUT_KEY
                ,Constants.DEFAULT_HTTP_TIMEOUT_VALUE+"");
        manager.setMaxInactiveInterval(Integer.parseInt(sessionTimeout));

        ServletManager.getInstance().addServletContext(module.getPort(), context.getServletContext());

        try {
            server.start();
        } catch (Exception e) {
            throw new IllegalStateException("Failed to start jetty server on " + NetUtils.getServerIp() + ":" +
                    module.getPort() +
                    ", cause: "
                    + e.getMessage(), e);
        }
    }

    @Override
    public void close() {
        super.close();
        ServletManager.getInstance().removeServletContext(module.getPort());
        try {
            server.stop();
        } catch (Exception e) {
            logger.warn(e.getMessage(),e);
        }
    }

    private void setFilter(ServerModel module, Context context, ServletHandler servletHandler){
        List<ServerModel.AcceptorFilter> filters = module.getFilters();
        for (ServerModel.AcceptorFilter filter:filters){
            checkFilter(filter);
            FilterHolder f = servletHandler.addFilterWithMapping(filter.getRef(),filter.getUrlPattern(), Context.REQUEST);
            context.addFilter(f,"/*",Context.REQUEST);
        }
    }
}
