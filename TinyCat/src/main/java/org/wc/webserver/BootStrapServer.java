package org.wc.webserver;

import io.netty.util.internal.StringUtil;
import org.apache.log4j.xml.DOMConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.wc.webserver.conf.ServerConfig;
import org.wc.webserver.handler.HttpServletRequest;
import org.wc.webserver.handler.HttpServletResponse;
import org.wc.webserver.handler.request.TinyHttpRequest;
import org.wc.webserver.handler.respone.TinyHttpResponse;
import org.wc.webserver.servlet.HttpServlet;
import org.wc.webserver.servlet.ServletCache;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Properties;

/**
 * Created by WenChen on 2019/5/15.
 */
public class BootStrapServer {

    private static Logger log = LoggerFactory.getLogger(BootStrapServer.class);

    private static Properties serverCfg;

    public static void main(String[] args) {
        /**
         * 启动TCP服务
         */
        /**
         * 1.读取配置文件，缓存下URL与对应的处理的Servlet的映射关系
         * 2.开启一个TCP服务，监听某个端口上的请求
         * 3.封装Request和Response
         * 3.设置过滤器，对HTTP请求进行过滤
         * 4.利用反射，执行对应的Servlet
         * 5.执行Response的过滤
         */
        loadResource();
        Socket socket = null;
        ServerSocket server = null;
        try {
            Integer serverPort = ServerConfig.getInt(ServerConfig.ServerProp.SERVER_PORT, 8080);
            server = new ServerSocket(serverPort);
            log.info("服务器启动完毕");
            while(true){
                try {
                    socket = server.accept();
                    InputStream inputStream = socket.getInputStream();
                    OutputStream outputStream = socket.getOutputStream();
                    HttpServletRequest request = new TinyHttpRequest(inputStream);
                    String uri = request.getRequestURI();
                    HttpServletResponse respone = new TinyHttpResponse(outputStream);
                    dispatchRequest(request,respone);
                    respone.respone("you have accessed :"+uri);
                    outputStream.close();
                    inputStream.close();
                    socket.close();//很重要，不然请求没有结束
                } catch (IOException e){
                    log.error("解析HTTP请求错误。。。");
                }
            }
        } catch (IOException e){
            log.error("启动服务器异常。。。");
        } catch (Exception e){
                log.error("发生错误，服务器关闭。。。");
        }
    }

    private static void dispatchRequest (HttpServletRequest request,HttpServletResponse response){
        try {
            String uri = request.getRequestURI();
            //每次http请求后会有一个空的tcp过来，所以要过滤这个
            if (StringUtil.isNullOrEmpty(uri)){
                return ;
            }
            HttpServlet servlet = ServletCache.getServlet(uri);
            if (servlet == null){
                //TODO 返回404
            }
            servlet.service(request,response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    private static void loadResource (){
        ServletCache.initCache();
        DOMConfigurator.configure("src/main/resources/log4j.xml");
    }
}
