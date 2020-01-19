package org.wc.webserver.support.resoruce.reader;

import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.wc.webserver.support.ServerModel;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by WenChen on 2020/1/6.
 */
public class HttpDomXmlParser implements ProtocolXmlParser {

    @Override
    public ServerModel parseByProtocol(Node node) {
        ServerModel module = new ServerModel();
        NodeList childList = node.getChildNodes();
        for (int i=0,length=childList.getLength();i<length;i++){
            Node child = childList.item(i);
            if ("handler".equals(child.getLocalName())){
                DomParseUtil.parseHandler(module,child);
            } else if ("attribute".equals(child.getLocalName())){
                DomParseUtil.parseAttribute(module,child);
            } else if ("filters".equals(child.getLocalName())){
                parseFilters(module,child);
            }
        }
        if (module.getHandler() == null)
            throw new IllegalArgumentException("handler not found");
        return module;
    }

    private void parseFilters(ServerModel module, Node node){
        NodeList filters = node.getChildNodes();
        List<ServerModel.AcceptorFilter> filterList = new ArrayList<>();
        for (int i=0,length=filters.getLength();i<length;i++){
            Node filter = filters.item(i);
            if ("filter".equals(filter.getLocalName())){
                NamedNodeMap map = filter.getAttributes();
                String ref = map.getNamedItem("ref").getNodeValue();
                String urlPattern = map.getNamedItem("url-pattern").getNodeValue();
                String name = map.getNamedItem("name").getNodeValue();
                ServerModel.AcceptorFilter f = new ServerModel.AcceptorFilter();
                f.setName(name);
                f.setRef(ref);
                f.setUrlPattern(urlPattern);
                filterList.add(f);
            }
        }
        module.setFilters(filterList);
    }

}
