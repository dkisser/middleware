package org.wc.webserver.protocol.http;


import org.wc.webserver.support.RequestResponseModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by WenChen on 2019/12/26.
 */
public interface HttpHandler {

    @Deprecated
    default void handler(HttpServletRequest request, HttpServletResponse response){}

    void handler(RequestResponseModel model);
}
