package org.wc.webserver.support.resoruce.reader;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.wc.webserver.support.ServerModule;

/**
 * Created by WenChen on 2020/1/6.
 */
public class TcpDomXmlParser implements ProtocolXmlParser{
    @Override
    public ServerModule parseByProtocol(Node node) {
        ServerModule module = new ServerModule();
        NodeList childList = node.getChildNodes();
        for (int i=0,length=childList.getLength();i<length;i++){
            Node child = childList.item(i);
            if ("handler".equals(child.getNodeName())){
                DomParseUtil.parseHandler(module,child);
            } else if ("attribute".equals(child.getNodeName())){
                DomParseUtil.parseAttribute(module,child);
            }
        }
        if (module.getHandler() == null)
            throw new IllegalArgumentException("handler not found");
        return module;
    }

}