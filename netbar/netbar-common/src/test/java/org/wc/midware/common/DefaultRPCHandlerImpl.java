package org.wc.midware.common;

import org.wc.midware.netbar.api.RPCHandler;

import java.util.Map;

/**
 * Created by WenChen on 2020/8/12.
 */
public class DefaultRPCHandlerImpl implements RPCHandler {
    @Override
    public Map handler(Map request) {
        System.out.println("recv request:"+request);
        return request;
    }
}
