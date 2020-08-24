package org.wc.midware.netbar.api;

import org.wc.midware.netbar.api.remote.Request;
import org.wc.prettydog.annotation.SPI;

import java.util.Map;

/**
 * Created by WenChen on 2020/8/13.
 */
@SPI("json")
public interface Resolver {

    Map pack (Request request);

    Request unpack (Map map);

}
