package org.wc.webserver.spring;

import org.springframework.beans.factory.xml.NamespaceHandlerSupport;

/**
 * Created by WenChen on 2020/1/19.
 */
public class TinyCatNamespaceSupport extends NamespaceHandlerSupport {
    @Override
    public void init() {
        registerBeanDefinitionParser("acceptors",new TinyCatBeanDefinitionParser());
    }
}
