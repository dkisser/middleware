package org.wc.webserver.protocol.http;

import org.wc.prettydog.support.ExtensionLoader;
import org.wc.webserver.conf.Constants;
import org.wc.webserver.protocol.AbstractProtocol;
import org.wc.webserver.protocol.Server;
import org.wc.webserver.support.ConfigurationTools;
import org.wc.webserver.support.ServerModule;
import org.wc.webserver.utils.ReflectUtils;

import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by WenChen on 2019/12/30.
 */
public class HttpProtocol extends AbstractProtocol {

    private HttpBinder binder;

    public HttpProtocol(){
        this.binder = ExtensionLoader.getExtensionLoader(HttpBinder.class)
                .getExtensionById(ConfigurationTools.getString(Constants
                .DEFAULT_HTTP_SERVER_KEY,Constants.DEFAULT_HTTP_SERVER_VALUE));
    }

    public HttpProtocol(HttpBinder binder) {
        this.binder = binder;
    }


    @Override
    public Server exportForModule(ServerModule module) {
        String resolverName = module.getHandlerClassName();
        HttpHandler handler;
        try {
            Class<?> handlerClazz = ReflectUtils.forNameWithThreadContextClassLoader(resolverName);
            ReflectUtils.isAssignableFrom(handlerClazz,HttpHandler.class);
            handler = (HttpHandler) handlerClazz.newInstance();
        } catch (ClassNotFoundException e) {
            throw new IllegalArgumentException(resolverName+" can't find");
        } catch (IllegalAccessException|InstantiationException e) {
            throw new IllegalArgumentException(resolverName+" can't get instance");
        }
        return binder.bind(module,handler);
    }

}
