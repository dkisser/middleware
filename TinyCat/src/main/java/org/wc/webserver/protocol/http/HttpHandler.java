package org.wc.webserver.protocol.http;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by WenChen on 2019/12/26.
 */
public interface HttpHandler {

    void handler(HttpServletRequest request, HttpServletResponse response);
}
