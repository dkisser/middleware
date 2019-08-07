package org.wc.webserver.servlet;

import org.wc.webserver.handler.HttpServletRequest;
import org.wc.webserver.handler.HttpServletResponse;

/**
 * Created by WenChen on 2019/5/17.
 */
public class MyHttpServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Get................!");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Post...............!");
    }
}
