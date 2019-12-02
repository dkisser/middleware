package org.wc.prettydog.proxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Created by WenChen on 2019/11/29.
 */
public class TestInterfaceJdkProxy implements InvocationHandler {

    private Object impl;

    public TestInterfaceJdkProxy(Object impl) {
        this.impl = impl;
    }

    public <T> T getProxy(){
        return (T)Proxy.newProxyInstance(impl.getClass().getClassLoader(),impl.getClass().getInterfaces(),this);
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.out.println("aaa");
        Object result = method.invoke(impl,args);
        System.out.println("bbb");
        return result;
    }
}
