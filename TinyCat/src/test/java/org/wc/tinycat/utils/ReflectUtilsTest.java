package org.wc.tinycat.utils;

import org.junit.Test;
import org.wc.tinycat.protocol.DefaultHttpHandler;
import org.wc.webserver.protocol.http.HttpHandler;
import org.wc.webserver.utils.ReflectUtils;

/**
 * Created by WenChen on 2019/12/31.
 */
public class ReflectUtilsTest {

    @Test
    public void isAssignableFromTest(){
        ReflectUtils.isAssignableFrom(DefaultHttpHandler.class, HttpHandler.class);
    }
}
