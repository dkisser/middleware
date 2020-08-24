package org.wc.midware.netbar.api;

import java.util.List;

/**
 * Created by WenChen on 2020/8/5.
 */
public interface Directory {

    List<Invoker> list(List<Invoker> invokers);

}
