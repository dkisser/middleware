package org.wc.webserver.protocol.http.servlet;

import org.wc.webserver.protocol.http.HttpHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2019/12/26.
 */
public class DispatcherServlet extends HttpServlet {

    private static Map<Integer,HttpHandler> HANDLERS = new ConcurrentHashMap<>();
    private static DispatcherServlet INSTANCE;
    public DispatcherServlet (){
        DispatcherServlet.INSTANCE = this;
    }

    public static void addHandler(int port,HttpHandler handler){
        HANDLERS.put(port,handler);
    }

    public static void removeHandler (int port){
        HANDLERS.remove(port);
    }

    public static DispatcherServlet getInstance(){
        return INSTANCE;
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpHandler handler = HANDLERS.get(req.getLocalPort());
        if (handler == null){
            resp.sendError(HttpServletResponse.SC_NOT_FOUND,"Service not found");
        } else {
            handler.handler(req,resp);
        }
    }
}
