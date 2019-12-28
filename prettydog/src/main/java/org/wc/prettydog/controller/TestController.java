package org.wc.prettydog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.wc.prettydog.util.AbstractHandler;
import org.wc.prettydog.util.HandlerProcessor;

@RestController
@RequestMapping(value = "/test")
public class TestController {

    @Autowired
    private HandlerProcessor handlerProcessor;

    @GetMapping
    @RequestMapping(value = "/testHandler")
    public String testHandler (String value){
        AbstractHandler hander = handlerProcessor.getHandler(value);
        hander.handle();
        return "Success!";
    }
}
