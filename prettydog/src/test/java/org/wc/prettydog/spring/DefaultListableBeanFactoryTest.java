package org.wc.prettydog.spring;

import org.junit.Test;
import org.springframework.beans.factory.support.DefaultListableBeanFactory;
import org.springframework.beans.factory.xml.XmlBeanDefinitionReader;
import org.springframework.core.io.ClassPathResource;

/**
 * 手动写使用IOC容器
 * BeanDefination的使用过程包括BeanDefination的定位、载入、注册
 * Created by WenChen on 2019/11/13.
 */
public class DefaultListableBeanFactoryTest {

    @Test
    public void testBeanDefination (){
        ClassPathResource resource = new ClassPathResource("prettydog.xml");
        DefaultListableBeanFactory beanFactory = new DefaultListableBeanFactory();
        XmlBeanDefinitionReader reader = new XmlBeanDefinitionReader(beanFactory);
        reader.loadBeanDefinitions(resource);
    }

}