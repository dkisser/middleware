package org.wc.webserver.filter;

import org.wc.webserver.handler.HttpServletRequest;
import org.wc.webserver.handler.HttpServletResponse;

/**
 * Created by WenChen on 2019/5/17.
 */
public class CharactFilter implements Filter{

    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) {
        System.out.println("CharactFilter Worked!");
        chain.doFilter(request,response,chain);
    }
}
