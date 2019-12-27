package org.wc.webserver.protocol;

import com.sun.deploy.net.protocol.ProtocolType;
import org.wc.webserver.support.resoruce.reader.Reader;

/**
 * Created by WenChen on 2019/12/26.
 */
public interface Protocol {

    void export(Reader reader);

    void unexport(Server server);

    enum ProtocolType{
        HTTP("http"),TCP("tcp");

        private ProtocolType(String value) {
            this.value = value;
        }

        private String value;

        public static ProtocolType typeOf (String s){
            ProtocolType[] types = values();
            for (ProtocolType type:types){
                if (type.value.equals(s)){
                    return type;
                }
            }
            return null;
        }

    }
}
