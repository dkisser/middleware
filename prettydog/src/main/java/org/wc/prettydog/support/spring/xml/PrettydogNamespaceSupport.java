package org.wc.prettydog.support.spring.xml;

import org.springframework.beans.factory.xml.NamespaceHandlerSupport;

/**
 * Created by WenChen on 2019/11/25.
 */
public class PrettydogNamespaceSupport extends NamespaceHandlerSupport {
    @Override
    public void init() {
        registerBeanDefinitionParser("bean",new PrettydogBeanDefinitionParser());
    }
}
