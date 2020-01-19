package org.wc.webserver.protocol.tcp;

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
public class TcpProtocol extends AbstractProtocol {

    private TcpBinder binder;

    public TcpProtocol() {
        this.binder = ExtensionLoader.getExtensionLoader(TcpBinder.class)
            .getExtensionById(ConfigurationTools.getString(
                Constants.DEFAULT_TCP_SERVER_KEY,Constants.DEFAULT_TCP_SERVER_VALUE));
    }

    @Override
    public Server exportForModule(ServerModel module) {
        TcpHandler handler = SpringApplicationContext.getObjct(TcpHandler.class,module.getName());
        ReflectUtils.isAssignableFrom(handler.getClass(),TcpHandler.class);
//        String resolverName = module.getHandler().getRef();
//        TcpHandler handler = ReflectUtils.getInstance(resolverName,TcpHandler.class);
        TcpHandler wrapper = TcpFilterWrapper.buildFilterChain(handler,module);
        return binder.bind(module,wrapper);
    }
}
