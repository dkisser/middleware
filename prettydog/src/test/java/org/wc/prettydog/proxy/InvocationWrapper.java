package org.wc.prettydog.proxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

/**
 * Created by WenChen on 2020/1/15.
 */
public class InvocationWrapper implements InvocationHandler {

    private Invocation invocation;

    public InvocationWrapper(Invocation invocation) {
        this.invocation = invocation;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        String methodName = method.getName();
        Class<?>[] parameterTypes = method.getParameterTypes();
        if (method.getDeclaringClass() == Object.class) {
            return method.invoke(invocation, args);
        }
        if ("toString".equals(methodName) && parameterTypes.length == 0) {
            return invocation.toString();
        }
        if ("hashCode".equals(methodName) && parameterTypes.length == 0) {
            return invocation.hashCode();
        }
        if ("equals".equals(methodName) && parameterTypes.length == 1) {
            return invocation.equals(args[0]);
        }
        return invocation.invoke(methodName,args);
    }
}
