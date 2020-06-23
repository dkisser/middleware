package org.wc.prettydog.spring.xml;

import org.junit.Test;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.wc.prettydog.util.itest.TestInterface;

/**
 * 基于sprig拓展自定义beanDefinition
 * 1.将springIOC与ExtensionLoader结合，实现基于接口的bean的注入
 * Created by WenChen on 2019/11/25.
 */
public class BeanDefiinitionTest {

    @Test
    public void testBean(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("prettydog.xml");
        context.start();
        TestInterface testInterface = (TestInterface) context.getBean("testInterface");
        testInterface.handler();
        context.stop();
    }

}
