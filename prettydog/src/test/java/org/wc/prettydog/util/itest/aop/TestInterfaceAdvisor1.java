package org.wc.prettydog.util.itest.aop;

import org.springframework.aop.MethodBeforeAdvice;

import java.lang.reflect.Method;

/**
 * Created by WenChen on 2020/5/22.
 */
public class TestInterfaceAdvisor1 implements MethodBeforeAdvice {
    @Override
    public void before(Method method, Object[] objects, Object o) throws Throwable {
        if ("handler".equals(method.getName())){
            System.out.println(method.getName()+" invoke before!");
        }
        if ("printA".equals(method.getName())){
            System.out.println(method.getName()+" invoke before!");
        }
        if ("printB".equals(method.getName())){
            System.out.println(method.getName()+" invoke before!");
        }
    }
}
