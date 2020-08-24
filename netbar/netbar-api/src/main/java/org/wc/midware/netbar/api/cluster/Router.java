package org.wc.midware.netbar.api.cluster;

import org.wc.midware.netbar.api.Invoker;

import java.util.List;

/**
 * Created by WenChen on 2020/8/12.
 */
public interface Router {

    List<Invoker> route(List<Invoker> invokers);
}
