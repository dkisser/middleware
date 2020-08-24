package org.wc.midware.netbar.api.remote;

import org.wc.midware.netbar.api.Invocation;

/**
 * Created by WenChen on 2020/8/13.
 */
public interface Request {

    Long getRequestId();

    Invocation getInvocation();

}
