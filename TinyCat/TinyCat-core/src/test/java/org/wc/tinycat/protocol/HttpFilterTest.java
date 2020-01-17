package org.wc.tinycat.protocol;


import org.wc.webserver.protocol.http.server.HttpFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

/**
 * Created by WenChen on 2020/1/2.
 */
public class HttpFilterTest extends HttpFilter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("11111-----");
        filterChain.doFilter(servletRequest,servletResponse);
    }
}
