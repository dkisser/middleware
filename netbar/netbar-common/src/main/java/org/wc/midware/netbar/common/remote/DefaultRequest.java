package org.wc.midware.netbar.common.remote;

import org.wc.midware.netbar.api.Invocation;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.api.remote.Request;

import java.util.concurrent.atomic.AtomicLong;

/**
 * Created by WenChen on 2020/8/11.
 */
public class DefaultRequest implements Request{

    private Long id;

    private static final AtomicLong mid = new AtomicLong(0);

    private Invocation invocation;

    public DefaultRequest() {
        this.id = mid.getAndIncrement();
    }

    public DefaultRequest(Long id, Invocation invocation) {
        this.id = id;
        this.invocation = invocation;
    }

    @Override
    public Long getRequestId() {
        return id;
    }

    @Override
    public Invocation getInvocation() {
        return invocation;
    }

    public Request setInvocation(Invocation invocation) {
        this.invocation = invocation;
        return this;
    }

}
