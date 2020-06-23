package org.wc.webserver.protocol.http.servlet;

import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.webserver.conf.Constants;
import org.wc.webserver.protocol.http.HttpHandler;
import org.wc.webserver.support.ConfigurationTools;
import org.wc.webserver.support.RequestResponseModel;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import static org.wc.webserver.support.Version.getIntVersion;

/**
 * Created by WenChen on 2019/12/26.
 */
public class DispatcherServlet extends HttpServlet {

    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);

    private static final String DEPRECATED_VERSION = "1.0";

    private static Map<Integer,HttpHandler> HANDLERS = new ConcurrentHashMap<>();

    private static DispatcherServlet INSTANCE;

    public DispatcherServlet (){
        DispatcherServlet.INSTANCE = this;
    }

    public static void addHandler(int port,HttpHandler handler){
        HANDLERS.put(port,handler);
    }

    public static void removeHandler (int port){
        HANDLERS.remove(port);
    }

    public static DispatcherServlet getInstance(){
        return INSTANCE;
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpHandler handler = HANDLERS.get(req.getLocalPort());
        if (handler == null){
            resp.sendError(HttpServletResponse.SC_NOT_FOUND,"URL not found");
        } else {
            String version = ConfigurationTools.getString(Constants.TINYCAT_VERSION_KEY,Constants
                    .TINYCAT_VERSION_VALUE);
            if (getIntVersion(version) <= getIntVersion(DEPRECATED_VERSION)){
                //compatitable old verion
                handler.handler(req,resp);
            } else {
                //parse HttpServletRequest
                RequestResponseModel model = new RequestResponseModel()
                        .setRequestBody(parseBody(req))
                        .setUri(parseUri(req))
                        .setRequestHead(parseHead(req));
                //handler
                handler.handler(model);
                //combine handler's reulst and HttpServletResponse
                combineRespone(resp,model);
            }
        }
    }

    private byte[] parseBody(HttpServletRequest request){
        ServletInputStream req = null;
        byte[] temp = null;
        try {
            req = request.getInputStream();
            temp = new byte[req.available()];
            req.read(temp);
        } catch (IOException e) {
            logger.error("parse body error",e);
        } finally {
            if (req!=null){
                try {
                    req.close();
                } catch (IOException e) {
                }
            }
        }
        return temp;
    }

    private String parseUri (HttpServletRequest request){
        return request.getRequestURI();
    }

    private Map<String,String> parseHead(HttpServletRequest request){
        Map<String,String> head = new HashMap<>();
        Enumeration<String> set = request.getHeaderNames();
        while (set.hasMoreElements()){
            String key = set.nextElement();
            String value = request.getHeader(key);
            head.put(key,value);
        }
        return head;
    }

    private void combineRespone(HttpServletResponse response,RequestResponseModel model){
        Map<String,String> head = model.getResponseHead();
        if (head != null && head.size() > 0){
            head.forEach((key,value)-> response.setHeader(key,value));
        }
        byte[] res = model.getResponseBody();
        ServletOutputStream out = null;
        if (res != null && res.length > 0){
            try {
                out = response.getOutputStream();
                out.write(res);
            } catch (IOException e) {
                logger.error("parse response error",e);
            } finally {
                if (out != null){
                    try {
                        out.close();
                    } catch (IOException e) {
                    }
                }
            }
        }
    }
}
