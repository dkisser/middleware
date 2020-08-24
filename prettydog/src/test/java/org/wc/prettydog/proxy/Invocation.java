package org.wc.prettydog.proxy;

/**
 * Created by WenChen on 2020/1/15.
 */
public interface Invocation {

    Object invoke(String method,Object[] args);

}
