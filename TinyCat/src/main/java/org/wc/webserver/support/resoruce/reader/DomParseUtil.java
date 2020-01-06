package org.wc.webserver.support.resoruce.reader;

import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.wc.webserver.support.ServerModule;

/**
 * Created by WenChen on 2020/1/6.
 */
public class DomParseUtil {

    public static void parseAttribute (ServerModule module, Node node){
        NamedNodeMap map = node.getAttributes();
        for (int i=0,length=map.getLength();i<length;i++){
            Node n = map.item(i);
            module.addAttributes(n.getNodeName(),n.getNodeValue());
        }
    }

    public static void parseHandler(ServerModule module,Node node){
        NamedNodeMap map = node.getAttributes();
        String ref = map.getNamedItem("ref").getNodeValue();
        ServerModule.AcceptorHandler handler = new ServerModule.AcceptorHandler();
        handler.setRef(ref);
        module.setHandler(handler);
    }
}
