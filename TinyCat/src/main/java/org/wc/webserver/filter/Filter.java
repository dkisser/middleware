package org.wc.webserver.filter;


import org.wc.webserver.handler.HttpServletRequest;
import org.wc.webserver.handler.HttpServletResponse;

/**
 * Created by WenChen on 2019/5/17.
 */
public interface Filter {

    void doFilter(HttpServletRequest request, HttpServletResponse response,FilterChain chain);
}
