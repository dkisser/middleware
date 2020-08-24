package org.wc.prettydog.proxy;


import javassist.*;

import java.lang.reflect.InvocationHandler;

/**
 * Created by WenChen on 2020/1/15.
 */
public abstract class Proxy {

    private static ClassLoader getClassLoader(Class<?> clz){
        ClassLoader classLoader;
        try {
            classLoader = Thread.currentThread().getContextClassLoader();

        } catch (Throwable t){
            try {
                classLoader = clz.getClassLoader();
            } catch (Throwable t1){
                classLoader = ClassLoader.getSystemClassLoader();
            }
        }
        return classLoader;
    }

    public static Proxy getProxy(Class<?> clazz){
        return getProxy(getClassLoader(Proxy.class),clazz);
    }

    public static <T> T getObject(Class<?>[] in,InvocationHandler handler){
       return (T) java.lang.reflect.Proxy.newProxyInstance(getClassLoader(null),in,handler);
    }

    public static Proxy getProxy(ClassLoader loader,Class<?> clazz){
        String proxyName = clazz.getName()+"$Proxy";
        Proxy proxy = null;
        ClassPool pool = ClassPool.getDefault();
        CtClass ctClass = pool.makeClass(proxyName);
        CtClass superctClass = pool.makeClass(Proxy.class.getName());
        try {
            ctClass.setSuperclass(superctClass);

            CtConstructor cons = new CtConstructor(null,ctClass);
            cons.setBody("{}");
            ctClass.addConstructor(cons);
            CtConstructor cons1 = new CtConstructor(new CtClass[]{pool.get(InvocationHandler.class.getName())},ctClass);
            cons1.setBody("{h = $1}");
            ctClass.addConstructor(cons1);
            CtField field = CtField.make("private "+InvocationHandler.class.getName()+" h;",ctClass);
            ctClass.addField(field);
            String methodStr = "public Object newInstance" +
                    "("+InvocationHandler.class.getName()+" " +
                    "handler){return new "+proxyName+"($1);}";
            CtMethod method = CtNewMethod.make(methodStr,ctClass);
            ctClass.addMethod(method);
            proxy = (Proxy) ctClass.toClass(loader,Proxy.class.getProtectionDomain()).newInstance();
        } catch (CannotCompileException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (NotFoundException e) {
            e.printStackTrace();
        }
        return proxy;
    }

    public abstract Object newInstance(InvocationHandler handler);
}
