package org.wc.midware.netbar.common;

import org.wc.midware.netbar.api.Invocation;
import org.wc.midware.netbar.api.URL;

import java.util.Map;

/**
 * Created by WenChen on 2020/8/13.
 */
public class DefaultInvocation implements Invocation {

    private Map request;

    private URL url;

    public DefaultInvocation(Map request, URL url) {
        this.request = request;
        this.url = url;
    }

    @Override
    public Map getRequest() {
        return request;
    }

    @Override
    public URL getUrl() {
        return url;
    }
}
