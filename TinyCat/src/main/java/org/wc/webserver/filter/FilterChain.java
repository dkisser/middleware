package org.wc.webserver.filter;

import org.wc.webserver.handler.HttpServletRequest;
import org.wc.webserver.handler.HttpServletResponse;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by WenChen on 2019/5/17.
 */
public class FilterChain implements Filter{

    private static List<Filter> array = new LinkedList<>();

    private static int index = 0;

    public FilterChain setFilter (Filter filter){
        array.add(filter);
        return this;
    }

    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) {
        if (array.size() == index){
            return;
        }
        Filter filter = array.get(index);
        index++;
        filter.doFilter(request,response,chain);
    }

    public static void main (String[] args){
        //初始化职责链
        FilterChain filterChain = new FilterChain();
        filterChain.setFilter(new CharactFilter());
        filterChain.setFilter(new HeadFilter());
        filterChain.doFilter(null,null,filterChain);
    }


}
