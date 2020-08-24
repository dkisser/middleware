package org.wc.midware.netbar.core;

import org.wc.midware.netbar.api.Exporter;
import org.wc.midware.netbar.api.Invoker;

/**
 * Created by WenChen on 2020/8/13.
 */
public class NetbarExporter implements Exporter {

    private String serviceKey;

    private Invoker invoker;

    public NetbarExporter(String serviceKey,Invoker invoker) {
        this.serviceKey = serviceKey;
        this.invoker = invoker;
    }

    @Override
    public Invoker getInvoker() {
        return invoker;
    }

    @Override
    public void unexport() {

    }

    @Override
    public String getServiceKey() {
        return serviceKey;
    }
}
