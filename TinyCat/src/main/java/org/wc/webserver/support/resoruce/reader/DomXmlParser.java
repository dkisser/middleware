package org.wc.webserver.support.resoruce.reader;

import org.w3c.dom.*;
import org.wc.webserver.conf.Constants;
import org.wc.webserver.protocol.Protocol;
import org.wc.webserver.support.ServerModule;
import org.wc.webserver.support.resoruce.Resource;

import javax.print.attribute.standard.MediaSize;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DomXmlParser implements XmlParser {

    @Override
    public List<ServerModule> parseResource(Resource resource) {
        try {
            return parseFile(resource.getFile());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<ServerModule> parseFile(File file) {
        List<ServerModule> modules = new ArrayList<>();
        Document document = getDocument(file);
        Element element = document.getDocumentElement();
        if (!"acceptors".equals(element.getTagName()))
            throw new IllegalArgumentException("Invalid root tag");
        if (!element.hasChildNodes())
            throw new IllegalArgumentException("acceptors has no child node");
        NodeList nodeList = element.getChildNodes();
        for (int i =0,length=nodeList.getLength();i<length;i++){
            Node node = nodeList.item(i);
            ServerModule module= parseAcceptor(node);
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

    private ServerModule parseAcceptor(Node node){
        ServerModule module = null;
        if ("acceptor".equals(node.getNodeName())){
            module = new ServerModule();
            NamedNodeMap map = node.getAttributes();
            checkAcceptor(map);
            String port = map.getNamedItem("port").getNodeValue();
            String protocolType = map.getNamedItem("type").getNodeValue();
            module.setPort(Integer.parseInt(port));
            module.setProtocolType(Protocol.ProtocolType.typeOf(protocolType));
            setAcceptorProperty(map,module);
            if (!node.hasChildNodes())
                throw new IllegalArgumentException("acceptor must contains child node");
            NodeList childList = node.getChildNodes();
            for (int i=0,length=childList.getLength();i<length;i++){
                Node child = childList.item(i);
                if ("handler".equals(child.getNodeName())){
                    parseHandler(module,child);
                } else if ("filters".equals(child.getNodeName())){
                    parseFilters(module,child);
                }
            }
            if (module.getHandler() == null)
                throw new IllegalArgumentException("handler not found");
        }
        return module;
    }

    private void parseHandler(ServerModule module,Node node){
        NamedNodeMap map = node.getAttributes();
        String ref = map.getNamedItem("ref").getNodeValue();
        ServerModule.AcceptorHandler handler = new ServerModule.AcceptorHandler();
        handler.setRef(ref);
        module.setHandler(handler);
    }

    private void parseFilters(ServerModule module,Node node){
        NodeList filters = node.getChildNodes();
        List<ServerModule.AcceptorFilter> filterList = new ArrayList<>();
        for (int i=0,length=filters.getLength();i<length;i++){
            Node filter = filters.item(i);
            if ("filter".equals(filter.getNodeName())){
                NamedNodeMap map = filter.getAttributes();
                String ref = map.getNamedItem("ref").getNodeValue();
                String urlPattern = map.getNamedItem("url-pattern").getNodeValue();
                String name = map.getNamedItem("name").getNodeValue();
                ServerModule.AcceptorFilter f = new ServerModule.AcceptorFilter();
                f.setName(name);
                f.setRef(ref);
                f.setUrlPattern(urlPattern);
                filterList.add(f);
            }
        }
        module.setFilters(filterList);
    }

    private void checkAcceptor(NamedNodeMap map){
        if (map.getNamedItem("port") == null){
            throw new IllegalArgumentException("acceptor port can't be null");
        }
        if (map.getNamedItem("type") == null){
            throw new IllegalArgumentException("acceptor type can't be null");
        }
    }

    private void setAcceptorProperty (NamedNodeMap map,ServerModule module){
        if (map.getNamedItem("consoleEncoding") != null){
            module.setConsoleEncoding(map.getNamedItem("consoleEncoding").getNodeValue());
        } else {
            module.setConsoleEncoding(Constants.DEFAULT_ENCODING);
        }
        if (map.getNamedItem("maxThreads") != null){
            module.setMaxThreads(map.getNamedItem("maxThreads").getNodeValue());
        } else {
            module.setMaxThreads(Constants.DEFAULT_HTTP_MAX_THREADS_VALUE+"");
        }
        if (map.getNamedItem("maxConnections") != null){
            module.setMaxConnections(map.getNamedItem("maxConnections").getNodeValue());
        } else {
            module.setMaxConnections(Constants.DEFULT_HTTP_MAX_CONNECTIONS_VALUE);
        }
        if (map.getNamedItem("connectionTimeout") != null){
            module.setConnectTimeOut(map.getNamedItem("connectionTimeout").getNodeValue());
        } else {
            module.setConnectTimeOut(Constants.DEFAULT_HTTP_TIMEOUT_VALUE+"");
        }
    }
}
