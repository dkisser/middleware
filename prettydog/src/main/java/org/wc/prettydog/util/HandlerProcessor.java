package org.wc.prettydog.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

//@Component
@Deprecated
public class HandlerProcessor implements BeanFactoryPostProcessor {

    private static final String PACKAGE_SCAN_PATH = "org.wc.prettydog.util";

    private static Map<String,Class> handleMap= new ConcurrentHashMap<>();

    @Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory configurableListableBeanFactory) throws BeansException {
        scan();
        System.out.println("初始化完毕 ，当前处理器数量为："+handleMap.size());
    }

    public void scan (){
        URL urls = null;
        try {
            urls = this.getClass().getClassLoader().getResource(PACKAGE_SCAN_PATH.replaceAll("\\.","/"));
            String path = URLDecoder.decode(urls.getFile(),"UTF-8");
            File dir = new File(path);
            File[] files = dir.listFiles();
            for (File file:files){
                String name = (PACKAGE_SCAN_PATH+"."+file.getName()).replaceAll("\\.class","");
                addHandle(name);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void addHandle (String filePath){
        Class clz = null;
        try {
            clz = Class.forName(filePath);
            HandlerType handlerType = (HandlerType) clz.getAnnotation(HandlerType.class);
            if (handlerType != null && clz.getSuperclass().equals(AbstractHandler.class)){
                String value = handlerType.value();
                handleMap.putIfAbsent(value,clz);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public AbstractHandler getHandler (String value){
        AbstractHandler handler = null;
        try {
            handler = (AbstractHandler) handleMap.get(value).newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return handler;
    }

}
