package org.wc.webserver.spring;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.beans.factory.support.ChildBeanDefinition;
import org.springframework.beans.factory.support.RootBeanDefinition;
import org.springframework.beans.factory.xml.BeanDefinitionParser;
import org.springframework.beans.factory.xml.ParserContext;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.wc.prettydog.support.ExtensionLoader;
import org.wc.webserver.support.ServerModel;
import org.wc.webserver.support.resoruce.reader.ApplicationReader;
import org.wc.webserver.support.resoruce.reader.ProtocolXmlParser;

/**
 * Created by WenChen on 2020/1/19.
 */
public class TinyCatBeanDefinitionParser implements BeanDefinitionParser {

    @Override
    public BeanDefinition parse(Element element, ParserContext parserContext) {
        RootBeanDefinition rootBeanDefinition = new RootBeanDefinition();
        NodeList nodes = element.getChildNodes();
        rootBeanDefinition.setLazyInit(false);
        rootBeanDefinition.setBeanClass(ServerModel.class);
        String rootId = "tinyCatServermodel";
        parserContext.getRegistry().registerBeanDefinition(rootId,rootBeanDefinition);
        for (int i=0;i<nodes.getLength();i++){
            Node node = nodes.item(i);
            if ("acceptor".equals(node.getLocalName())){
                checkAcceptor(node.getAttributes());
                ServerModel model = parseAcceptor(node);
                ApplicationReader.addModel(model);
                if (parserContext.getRegistry().containsBeanDefinition(model.getName())) {
                    throw new IllegalStateException("Duplicate spring bean id " + model.getName());
                }
                ChildBeanDefinition child = new ChildBeanDefinition(model.getName());
//                child.getPropertyValues().addPropertyValue("name", model.getName());
//                child.getPropertyValues().addPropertyValue("type", model.getProtocolType());
//                child.getPropertyValues().addPropertyValue("port", model.getPort());
                child.setBeanClassName(model.getHandler().getRef());
                child.setLazyInit(false);
                child.setParentName(rootId);
                parserContext.getRegistry().registerBeanDefinition(model.getName(),child);
            }
        }
        return rootBeanDefinition;
    }

    private void checkAcceptor(NamedNodeMap map){
        if (map.getNamedItem("name") == null){
            throw new IllegalArgumentException("acceptor port can't be null");
        }
        if (map.getNamedItem("port") == null){
            throw new IllegalArgumentException("acceptor port can't be null");
        }
        if (map.getNamedItem("type") == null){
            throw new IllegalArgumentException("acceptor type can't be null");
        }
    }

    private ServerModel parseAcceptor(Node node){
        NamedNodeMap map = node.getAttributes();
        String name = map.getNamedItem("name").getNodeValue();
        String port = map.getNamedItem("port").getNodeValue();
        String protocolType = map.getNamedItem("type").getNodeValue();
        ProtocolXmlParser protocolParser = ExtensionLoader.getExtensionLoader(ProtocolXmlParser.class)
                .getExtensionById(protocolType);
        ServerModel module = protocolParser.parseByProtocol(node);
        module.setPort(Integer.parseInt(port));
        module.setProtocolType(protocolType);
        module.setName(name);
        if (!node.hasChildNodes())
            throw new IllegalArgumentException("acceptor must contains child node");
        if (module.getHandler() == null)
            throw new IllegalArgumentException("handler not found");
        return module;
    }
}
