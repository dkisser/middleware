package org.wc.midware.netbar.api;

import java.util.Map;

/**
 * Created by WenChen on 2020/8/5.
 */
public interface Invocation {

    Map getRequest();

    URL getUrl();
}
