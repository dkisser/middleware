package org.wc.webserver.servlet;

import org.wc.webserver.handler.HttpServletRequest;
import org.wc.webserver.handler.HttpServletResponse;

import java.util.Arrays;

/**
 * Created by WenChen on 2019/5/17.
 */
public abstract class HttpServlet {

    public abstract void doGet(HttpServletRequest request, HttpServletResponse response);

    public abstract void doPost(HttpServletRequest request,HttpServletResponse response);

    public void service (HttpServletRequest request,HttpServletResponse response){
        if (request.getMethod().equalsIgnoreCase("GET")){
            doGet(request,response);
        } else if (request.getMethod().equalsIgnoreCase("POST")){
            doPost(request,response);
        } else {
            doPost(request,response);
        }
    }

}
