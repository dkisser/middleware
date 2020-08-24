package org.wc.midware.netbar.api;

import org.wc.midware.netbar.api.remote.Result;

/**
 * Created by WenChen on 2020/8/5.
 */
public interface Invoker {

    Result invoke(Invocation invocation);

    boolean isAvaliable(URL url);

    void destroy();
}
