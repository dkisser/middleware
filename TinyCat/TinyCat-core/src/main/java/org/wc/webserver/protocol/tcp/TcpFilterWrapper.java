package org.wc.webserver.protocol.tcp;

import org.wc.webserver.support.ServerModel;
import org.wc.webserver.utils.ReflectUtils;

import java.util.List;

/**
 * Created by WenChen on 2020/1/16.
 */
public class TcpFilterWrapper {

    public static TcpHandler buildFilterChain (TcpHandler handler, ServerModel model){
        TcpHandler last = handler;
        List<ServerModel.AcceptorFilter> filters = model.getFilters();
        for (ServerModel.AcceptorFilter filter:filters){
            TcpFilter h = ReflectUtils.getInstance(filter.getRef(),TcpFilter.class);
            TcpHandler next = last;
            last = req -> h.filter(req,next);
        }
        return last;
    }
}
