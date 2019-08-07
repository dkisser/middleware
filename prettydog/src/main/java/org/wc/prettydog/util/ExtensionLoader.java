package org.wc.prettydog.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.wc.prettydog.annotation.Prototype;
import org.wc.prettydog.annotation.SPI;
import org.wc.prettydog.annotation.SPIMeta;
import org.wc.prettydog.annotation.Singleton;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Enumeration;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2019/8/7.
 */
public class ExtensionLoader<T> {

    private Logger logger = LoggerFactory.getLogger(ExtensionLoader.class);

    private static final String PRFFFIX = "META-INF/spi/";

    private static ConcurrentHashMap<Class<?>,ExtensionLoader> extensionLoaders = new ConcurrentHashMap<>(10);

    private ConcurrentHashMap<String,Class<T>> extensionClass;

    private ConcurrentHashMap<String,T> singletone;

    private boolean init;

    private ClassLoader classLoader;

    private Class<T> type;

    private ExtensionLoader (Class<T> type){
        this(type,Thread.currentThread().getContextClassLoader());
    }

    public ExtensionLoader (Class<T> type,ClassLoader classLoader){
        this.singletone = new ConcurrentHashMap<>();
        extensionClass = new ConcurrentHashMap<>();
        this.init = false;
        this.classLoader = classLoader;
        this.type=type;
    }

    public static <T> ExtensionLoader<T> getExtensionLoader(Class<T> clazz){
        //检查class是不是有spi注解的接口
        checkInterfaceType(clazz);
        ExtensionLoader extensionLoader = extensionLoaders.get(clazz);
        if (extensionLoader == null){
            extensionLoader = new ExtensionLoader(clazz);
            extensionLoaders.putIfAbsent(clazz,extensionLoader);
        }
        return extensionLoader;
    }

    public T getByExtensionId (String id){
        checkInit();
        return id != null ? getOrCreateInstance(id): null;
    }

    private void checkInit (){
        if (!this.init){
            //加载spi的类
            loadExtensionClasses();
        }
    }

    private void loadExtensionClasses (){
        this.init = true;
        this.extensionClass = loadExtensionClasses(PRFFFIX+type.getName());
    }

    private ConcurrentHashMap<String,Class<T>> loadExtensionClasses(String path){
        Enumeration<URL> urls = null;
        ConcurrentHashMap<String,Class<T>> classMap = new ConcurrentHashMap<>();
        try {
            if (this.classLoader == null){
                urls = ClassLoader.getSystemResources(path);
            } else {
                urls = this.classLoader.getResources(path);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (urls == null || !urls.hasMoreElements()){
            failThrows(type,String.format("path [%s] can't find spi file to load",path));
        } else {
            while(urls.hasMoreElements()){
                URL url = urls.nextElement();
                parseUrl(url,classMap);
            }
        }
        return classMap;
    }

    private void parseUrl (URL url,ConcurrentHashMap<String,Class<T>> classMap){
        InputStream inputStream = null;
        BufferedReader reader = null;
        try {
            inputStream = url.openStream();
            reader = new BufferedReader(new InputStreamReader(inputStream));
            int lineNumer = 0;
            String line ;
            while ((line = reader.readLine())!=null){
                lineNumer ++;
                try {
                    parseLine(line,lineNumer,classMap);
                } catch (Exception e) {
                    logger.error("加载SPI配置文件第{}行出现错误,改行已跳过。",lineNumer);
                }
            }
        } catch (IOException e) {
            logger.error("读取文件{}失败",url.getFile());
        } finally {
            if (reader != null){
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (inputStream != null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void parseLine (String line,int lineNumer,ConcurrentHashMap<String,Class<T>> classMap) throws ClassNotFoundException {
        if (line.startsWith("#")){
            return ;
        }
        Class clazz;
        if (this.classLoader == null){
            clazz = Class.forName(line);
        } else {
            clazz = Class.forName(line,true,this.classLoader);
        }
        String spiName = getSpiName(clazz);
        SPIMeta spiMeta = (SPIMeta) clazz.getAnnotation(SPIMeta.class);
        Class<T> oldClass = classMap.putIfAbsent(spiName,clazz);
        if (oldClass != null){
            SPIMeta oldMeta = oldClass.getAnnotation(SPIMeta.class);
            if (spiMeta != null && oldMeta != null){
                if (spiMeta.order() > oldMeta.order()){
                    logger.info("{}:SPI id has already exist, new Class's order > old class's order,override",clazz.getName());
                    classMap.put(spiName,clazz);
                } else {
                    logger.info("{}:SPI id has already exist, new Class's order < old class's order,not override",clazz.getName());
                }
            }
        }
    }

    private String getSpiName (Class<T> clazz){
        SPIMeta spiMeta = clazz.getAnnotation(SPIMeta.class);
        String name = spiMeta != null && !"".equals(spiMeta.id()) ? spiMeta.id() : clazz.getSimpleName();
        return name;
    }

    private T getOrCreateInstance (String id){
        //判断是单例还是多例
        T instance = null;
        Class<T> clazz = this.extensionClass.get(id);
        if (clazz == null){
            return null;
        }
        Boolean prototype = clazz.isAnnotationPresent(Prototype.class);
        Boolean singleton = clazz.isAnnotationPresent(Singleton.class);
        if (prototype && singleton){
            failThrows(this.type,"@Prototype or @Singleton only one can be present in Class");
        }
        try {
            if (prototype){
                    instance = clazz.newInstance();
            } else {
                instance = getSingletonById(id);
            }
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return instance;
    }

    private T getSingletonById (String id) throws IllegalAccessException, InstantiationException {
        T instance = singletone.get(id);
        if (instance == null){
            Class<T> clazz = extensionClass.get(id);
            instance = clazz.newInstance();
            singletone.putIfAbsent(id,instance);
        }
        return instance;
    }

    private static <T> void checkInterfaceType(Class<T> type){
        if (type == null){
            failThrows(type,"Can't be null");
        }
        if (!type.isInterface()){
            failThrows(type,"Is't an Interface");
        }
        if (!isSPIType(type)){
            failThrows(type,"Without @spi Annotation");
        }
    }

    private static <T> boolean isSPIType(Class<T> clazz){
        return clazz.isAnnotationPresent(SPI.class);
    }

    private static <T> void failThrows (Class<T> type,String msg){
        throw new RuntimeException(type.getName()+":"+msg);
    }

}
