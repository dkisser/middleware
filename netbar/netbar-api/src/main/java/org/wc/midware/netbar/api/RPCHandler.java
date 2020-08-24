package org.wc.midware.netbar.api;

import java.util.Map;
import java.util.logging.Handler;

/**
 * Created by WenChen on 2020/8/12.
 */
public interface RPCHandler {

    Map handler(Map request);

}
