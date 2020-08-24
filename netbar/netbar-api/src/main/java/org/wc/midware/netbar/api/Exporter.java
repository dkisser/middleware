package org.wc.midware.netbar.api;

/**
 * Created by WenChen on 2020/8/13.
 */
public interface Exporter {

    Invoker getInvoker();

    void unexport();

    String getServiceKey();
}
