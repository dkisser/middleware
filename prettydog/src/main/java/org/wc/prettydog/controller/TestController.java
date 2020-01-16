package org.wc.prettydog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.wc.prettydog.util.AbstractHandler;
import org.wc.prettydog.util.HandlerProcessor;


public class TestController {

    @Autowired
    private HandlerProcessor handlerProcessor;


    public String testHandler (String value){
        AbstractHandler hander = handlerProcessor.getHandler(value);
        hander.handle();
        return "Success!";
    }
}
