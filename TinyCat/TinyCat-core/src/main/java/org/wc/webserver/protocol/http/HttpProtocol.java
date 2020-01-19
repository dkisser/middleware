package org.wc.webserver.protocol.http;

import org.wc.prettydog.support.ExtensionLoader;
import org.wc.webserver.conf.Constants;
import org.wc.webserver.protocol.AbstractProtocol;
import org.wc.webserver.protocol.Server;
import org.wc.webserver.spring.SpringApplicationContext;
import org.wc.webserver.support.ConfigurationTools;
import org.wc.webserver.support.ServerModel;
import org.wc.webserver.utils.ReflectUtils;

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
    public Server exportForModule(ServerModel module) {
        HttpHandler handler = SpringApplicationContext.getObjct(HttpHandler.class,module.getName());
        ReflectUtils.isAssignableFrom(handler.getClass(),HttpHandler.class);
//        String resolverName = module.getHandler().getRef();
//        HttpHandler handler = ReflectUtils.getInstance(resolverName,HttpHandler.class);
        return binder.bind(module,handler);
    }

}
