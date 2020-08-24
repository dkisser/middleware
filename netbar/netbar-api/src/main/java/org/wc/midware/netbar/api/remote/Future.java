package org.wc.midware.netbar.api.remote;

import org.wc.midware.netbar.api.remote.Result;

/**
 * Created by WenChen on 2020/8/11.
 */
public interface Future {

    Result get(int timeout);

}
