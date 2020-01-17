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
public class TcpDomXmlParser implements ProtocolXmlParser{
    @Override
    public ServerModel parseByProtocol(Node node) {
        ServerModel module = new ServerModel();
        NodeList childList = node.getChildNodes();
        for (int i=0,length=childList.getLength();i<length;i++){
            Node child = childList.item(i);
            if ("handler".equals(child.getNodeName())){
                DomParseUtil.parseHandler(module,child);
            } else if ("attribute".equals(child.getNodeName())){
                DomParseUtil.parseAttribute(module,child);
            } else if ("filters".equals(child.getNodeName())){
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
            if ("filter".equals(filter.getNodeName())){
                NamedNodeMap map = filter.getAttributes();
                String ref = map.getNamedItem("ref").getNodeValue();
                ServerModel.AcceptorFilter f = new ServerModel.AcceptorFilter();
                f.setRef(ref);
                filterList.add(f);
            }
        }
        module.setFilters(filterList);
    }

}