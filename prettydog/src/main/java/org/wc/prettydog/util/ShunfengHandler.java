package org.wc.prettydog.util;

@HandlerType(value = "1")
public class ShunfengHandler extends AbstractHandler {
    @Override
    public void handle() {
        System.out.println("顺丰快递为您服务");
    }
}
