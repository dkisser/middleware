package org.wc.webserver.support.resoruce.reader;

import org.w3c.dom.*;
import org.wc.prettydog.support.ExtensionLoader;
import org.wc.webserver.support.ServerModel;
import org.wc.webserver.support.resoruce.Resource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DomXmlParser implements XmlParser {

    @Override
    public List<ServerModel> parseResource(Resource resource) {
        try {
            return parseFile(resource.getFile());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<ServerModel> parseFile(File file) {
        List<ServerModel> modules = new ArrayList<>();
        Document document = getDocument(file);
        Element element = document.getDocumentElement();
        if (!"acceptors".equals(element.getTagName()))
            throw new IllegalArgumentException("Invalid root tag");
        if (!element.hasChildNodes())
            throw new IllegalArgumentException("acceptors has no child node");
        NodeList nodeList = element.getChildNodes();
        for (int i =0,length=nodeList.getLength();i<length;i++){
            Node node = nodeList.item(i);
            ServerModel module= parseAcceptor(node);
            if (module!=null)
                modules.add(module);
        }
        return modules;
    }

    private Document getDocument(File file){
        DocumentBuilder builder;
        Document document;
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            builder = factory.newDocumentBuilder();
            document = builder.parse(file);
        } catch (Exception e) {
            throw new IllegalArgumentException("xml parse faild",e);
        }
        return document;
    }

    private ServerModel parseAcceptor(Node node){
        ServerModel module = null;
        if ("acceptor".equals(node.getNodeName())){
            NamedNodeMap map = node.getAttributes();
            checkAcceptor(map);
            String port = map.getNamedItem("port").getNodeValue();
            String protocolType = map.getNamedItem("type").getNodeValue();
            ProtocolXmlParser protocolParser = ExtensionLoader.getExtensionLoader(ProtocolXmlParser.class)
                    .getExtensionById(protocolType);
            module = protocolParser.parseByProtocol(node);
            module.setPort(Integer.parseInt(port));
            module.setProtocolType(protocolType);

            if (!node.hasChildNodes())
                throw new IllegalArgumentException("acceptor must contains child node");
            if (module.getHandler() == null)
                throw new IllegalArgumentException("handler not found");
        }
        return module;
    }

    private void checkAcceptor(NamedNodeMap map){
        if (map.getNamedItem("port") == null){
            throw new IllegalArgumentException("acceptor port can't be null");
        }
        if (map.getNamedItem("type") == null){
            throw new IllegalArgumentException("acceptor type can't be null");
        }
    }

}
