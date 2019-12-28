package org.wc.prettydog.util;

@HandlerType(value = "2")
public class YuantongHandler extends AbstractHandler {
    @Override
    public void handle() {
        System.out.println("圆通快递为您服务！");
    }
}
