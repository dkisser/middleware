package org.wc.webserver.handler;

/**
 * Created by WenChen on 2019/5/16.
 * API
 */
public interface HttpServletRequest {

    String getRequestURI();

    String getParameter(String paramName);

    String getMethod();
}
