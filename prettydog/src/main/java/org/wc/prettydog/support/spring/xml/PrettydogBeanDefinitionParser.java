package org.wc.prettydog.support.spring.xml;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.support.GenericBeanDefinition;
import org.springframework.beans.factory.xml.BeanDefinitionParser;
import org.springframework.beans.factory.xml.ParserContext;
import org.springframework.util.StringUtils;
import org.w3c.dom.Element;
import org.wc.prettydog.support.ExtensionLoader;

/**
 * Created by WenChen on 2019/11/25.
 */
public class PrettydogBeanDefinitionParser implements BeanDefinitionParser {

    @Override
    public BeanDefinition parse(Element element, ParserContext parserContext) {
        String tagName = element.getLocalName();
        BeanDefinitionRegistry registry = parserContext.getRegistry();
        if ("bean".equals(tagName)){
            return parseBean(registry,element);
        }
        return null;
    }

    private BeanDefinition parseBean(BeanDefinitionRegistry registry,Element element){
        String id,name,clazz,ref,beanName,impl;
        Class<?> beanClass = null;
        id = element.getAttribute("id");
        name = element.getAttribute("name");
        if (StringUtils.hasText(id)){
            beanName = id;
        } else if (StringUtils.hasText(name)){
            beanName = name;
        } else {
            throw new IllegalStateException("id and name can't be null at the same time");
        }
        clazz = element.getAttribute("class");
        ref = element.getAttribute("ref");
        impl = element.getAttribute("impl");
        if (StringUtils.hasText(clazz)){
            beanClass = getExtensionClass(clazz,impl);
        } else if (StringUtils.hasText(ref)){
            try {
                beanClass = Class.forName(ref);
            } catch (ClassNotFoundException e) {
                throw new IllegalStateException(String.format("bean[%s],can't be find it's ref class",beanName));
            }
        }
        GenericBeanDefinition bean = new GenericBeanDefinition();
        bean.setBeanClass(beanClass);
        bean.setLazyInit(false);
        registry.registerBeanDefinition(beanName,bean);
        return bean;
    }

    private Class<?> getExtensionClass (String beanName,String impl){
        Class<?> clazz;
        try {
            clazz = Class.forName(beanName,true,getDefaultClassLoader());
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException(String.format("bean[%s],can't be find it's ref class",beanName));
        }
        if (clazz.isInterface()){
            if (StringUtils.hasText(impl)){
                clazz = ExtensionLoader.getExtensionLoader(clazz).getClassByExtensionId(impl);
            } else {
                clazz = ExtensionLoader.getExtensionLoader(clazz).getClassByExtensionId("default");
            }
        }
        return clazz;
    }

    private ClassLoader getDefaultClassLoader (){
        return Thread.currentThread().getContextClassLoader();
    }

}
