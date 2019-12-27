package org.wc.webserver.support;

import org.wc.webserver.protocol.Protocol;

/**
 * Created by WenChen on 2019/12/27.
 */
public class ServerModule {

    private int port;

    private String consoleEncoding;

    private Protocol.ProtocolType protocolType;

    private String handlerClassName;

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public String getConsoleEncoding() {
        return consoleEncoding;
    }

    public void setConsoleEncoding(String consoleEncoding) {
        this.consoleEncoding = consoleEncoding;
    }

    public Protocol.ProtocolType getProtocolType() {
        return protocolType;
    }

    public void setProtocolType(Protocol.ProtocolType protocolType) {
        this.protocolType = protocolType;
    }

    public String getHandlerClassName() {
        return handlerClassName;
    }

    public void setHandlerClassName(String handlerClassName) {
        this.handlerClassName = handlerClassName;
    }
}
