package org.wc.webserver.support.resoruce.reader;

import org.w3c.dom.*;
import org.wc.webserver.protocol.Protocol;
import org.wc.webserver.support.ServerModule;
import org.wc.webserver.support.resoruce.Resource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DomXmlParser implements XmlParser {
    @Override
    public List<ServerModule> parseResource(Resource resource) {
        List<ServerModule> modules = new ArrayList<>();
        try {
            Document document = getDocument(resource.getFile());
            Element element = document.getDocumentElement();
            if (!"acceptors".equals(element.getTagName())){
                throw new IllegalArgumentException("Invalid root tag");
            }
            NodeList nodeList = element.getChildNodes();
            for (int i =0,length=nodeList.getLength();i<length;i++){
                Node node = nodeList.item(i);
                ServerModule module= parseAcceptor(node);
                if (module!=null){
                    modules.add(module);
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return modules;
    }

    @Override
    public List<ServerModule> parseFile(File file) {

        return null;
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

    private ServerModule parseAcceptor(Node node){
        ServerModule module = null;
        if ("acceptor".equals(node.getNodeName())){
            NamedNodeMap map = node.getAttributes();
            String port = map.getNamedItem("port").getNodeValue();
            String consoleEncoding = map.getNamedItem("consoleEncoding").getNodeValue();
            String protocolType = map.getNamedItem("type").getNodeValue();
            String handler = map.getNamedItem("handler").getNodeValue();
            module = new ServerModule();
            module.setConsoleEncoding(consoleEncoding);
            module.setPort(Integer.parseInt(port));
            module.setProtocolType(Protocol.ProtocolType.typeOf(protocolType));
            module.setHandlerClassName(handler);
        }
        return module;
    }
}
