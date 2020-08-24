package org.wc.midware.netbar.api.remote;

import java.util.Map;

/**
 * Created by WenChen on 2020/8/5.
 */
public interface Result {

    Throwable getException();

    Map getValue();

    Boolean hasException();
}
