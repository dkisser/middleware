package org.wc.webserver.servlet;

import io.netty.util.internal.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.wc.webserver.conf.ServletConfig;

import java.lang.ref.SoftReference;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2019/5/17.
 * 用于缓存servlet与URL的关系
 */
public class ServletCache {

    private Logger log = LoggerFactory.getLogger(ServletCache.class);

    /**
     * key为uri  value为servlet实例
     */
    private static ConcurrentHashMap<String,SoftReference<HttpServlet>> servletCache = new ConcurrentHashMap<>();

    /**
     * key为uri  value为与之对应的servlet路径
     */
    private static Map<String,String> uriCache= new HashMap<>();

    /**
     * 初始化缓存
     */
    public static void initCache (){
        initUri();
        initServlet();
    }
    /**
     * 初始化uri缓存
     */
    private static void initUri (){
        String uri = ServletConfig.getString(ServletConfig.ServletProp.SERVLET_URI,null);
        String servletPath = ServletConfig.getString(ServletConfig.ServletProp.SERVLET_SERVLETPATH,null);
        uriCache.put(uri,servletPath);
    }

    /**
     * 初始化servlet缓存
     */
    private static void initServlet(){
        String uri = ServletConfig.getString(ServletConfig.ServletProp.SERVLET_URI,null);
        try {
            servletCache.put(uri,new SoftReference<>(getServlet(uri)));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static HttpServlet getServlet (String uri) throws ClassNotFoundException {
        SoftReference<HttpServlet> reference = servletCache.getOrDefault(uri,null);
        if (reference == null){
            //初始化这个servlet并写入map
            return invokeServletByUri(uri);
        }
        HttpServlet servlet = reference.get();
        if (servlet == null){
            //初始化这个servlet并写入map
            return invokeServletByUri(uri);
        }
        return servlet;
    }

    private static HttpServlet invokeServletByUri (String uri) throws ClassNotFoundException {
        if (uriCache == null){
            throw new NullPointerException("URI与Servlet之间的映射关系未初始化");
        }
        String servletPath = uriCache.get(uri);
        if (StringUtil.isNullOrEmpty(servletPath)){
            return null;
        }
        //利用反射实例化这个Servlet;
        Class<HttpServlet> servletClass = (Class<HttpServlet>)Class.forName(servletPath);
        HttpServlet httpServlet = null;
        try {
            httpServlet = servletClass.newInstance();
            servletCache.put(uri,new SoftReference<>(httpServlet));
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return httpServlet;
    }

}
