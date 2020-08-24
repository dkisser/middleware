package org.wc.prettydog.spring.aop;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.wc.prettydog.util.itest.TestInterface;
import org.wc.prettydog.util.itest.aop.Printer;

/**
 * Created by WenChen on 2020/5/22.
 */
public class AopTest {

    /**
     * debug JdkDynamicAopProxy.getProxy to see how generate Proxy
     */
    @Test
    public void testAop(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("prettydog.xml");
        context.start();
        TestInterface testInterface = (TestInterface) context.getBean("testAop");
        testInterface.handler();
        context.stop();
    }

    /**
     * debug CglibAopProxy.intercept to see how interceptorChain works
     */
    @Test
    public void testAop2(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("prettydog.xml");
        context.start();
        Printer testInterface = (Printer)context.getBean("testAop2");
        testInterface.printA();
        testInterface.printB();
        context.stop();
    }
}
