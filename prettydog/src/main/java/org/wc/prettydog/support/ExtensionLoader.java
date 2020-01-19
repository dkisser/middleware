package org.wc.prettydog.support;

import javafx.util.Pair;
import org.wc.prettydog.annotation.SPI;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.prettydog.util.StringUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.ReentrantLock;
import java.util.regex.Pattern;

/**
 * Created by WenChen on 2019/8/7.
 */
public class ExtensionLoader<T> {

    private Logger logger = LoggerFactory.getLogger(ExtensionLoader.class);

    private static final String PRFFFIX = "META-INF/spi/";

    private static final Pattern SPI_NAME_REGEX = Pattern.compile("=");

    private static ConcurrentHashMap<Class<?>,ExtensionLoader> extensionLoaders = new ConcurrentHashMap<>(10);

    private ConcurrentHashMap<String,Class<?>> extensionClass;

    private ConcurrentHashMap<String,T> singletone;

    private Set<Class<?>> wrapperClass;

    private Holder<Class<?>> defaultClass;

    private Holder<Object> defaultInstance;

    private volatile boolean init;

    private ReentrantLock lock = new ReentrantLock();

    private ClassLoader classLoader;

    private Class<T> type;

    private ExtensionLoader (Class<T> type){
        this(type,Thread.currentThread().getContextClassLoader());
    }

    private ExtensionLoader (Class<T> type,ClassLoader classLoader){
        this.singletone = new ConcurrentHashMap<>();
        extensionClass = new ConcurrentHashMap<>();
        this.init = false;
        this.classLoader = classLoader;
        this.type=type;
        this.wrapperClass = new HashSet<>();
    }

    public static <T> ExtensionLoader<T> getExtensionLoader(Class<T> clazz){
        checkInterfaceType(clazz);
        ExtensionLoader extensionLoader = extensionLoaders.get(clazz);
        if (extensionLoader == null){
            extensionLoaders.putIfAbsent(clazz,new ExtensionLoader(clazz));
            extensionLoader = extensionLoaders.get(clazz);
        }
        return extensionLoader;
    }

    public T getExtensionById (String id){
        checkInit();
        return id != null ? getOrCreateInstance(id): null;
    }

    public Class<?> getClassByExtensionId (String id){
        checkInit();
        return id != null ? extensionClass.getOrDefault(id,null):null;
    }

    public T getDefaultExtension (){
        checkInit();
        return initDefaultExtension();
    }

    /**
     * Double check init
     */
    private void checkInit (){
        if (!this.init){
            try {
                lock.lock();
                if (!this.init){
                    loadExtensionClasses();
                }
            } finally {
                lock.unlock();
            }
        }
    }

    private void loadExtensionClasses (){
        this.init = true;
        this.extensionClass = loadExtensionClasses(PRFFFIX+type.getName());
    }

    private ConcurrentHashMap<String,Class<?>> loadExtensionClasses(String path){
        Enumeration<URL> urls = null;
        ConcurrentHashMap<String,Class<?>> classMap = new ConcurrentHashMap<>();
        try {
            if (this.classLoader == null){
                urls = ClassLoader.getSystemResources(path);
            } else {
                urls = this.classLoader.getResources(path);
            }
        } catch (IOException e) {
            logger.error("Loead file Error,{}",e);
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

    private void parseUrl (URL url,ConcurrentHashMap<String,Class<?>> classMap){
        InputStream inputStream = null;
        BufferedReader reader = null;
        try {
            inputStream = url.openStream();
            reader = new BufferedReader(new InputStreamReader(inputStream));
            int lineNumer = 0;
            String line ;
            while ((line = reader.readLine())!=null){
                try {
                    parseLine(line,classMap);
                } catch (Exception e) {
                    logger.error("Load error on line:{} ,skipped. {}",lineNumer,e);
                }
                lineNumer ++;
            }
        } catch (IOException e) {
            logger.error("read file:{} error!",url.getFile());
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

    private void parseLine (String line,ConcurrentHashMap<String,Class<?>> classMap) throws
            ClassNotFoundException, IllegalAccessException {

        Pair<String,String> pair = parseText(line);
        if (pair == null) return;
        String name = pair.getKey(),value = pair.getValue();
        if (classMap.containsKey(name)){
            throw new IllegalArgumentException(String.format("[%s] has already bind to another!",name));
        }
        Class<?> clazz;
        if (this.classLoader == null){
            clazz = Class.forName(value);
        } else {
            clazz = Class.forName(value,true,this.classLoader);
        }
        if (!type.isAssignableFrom(clazz)){
            throw new IllegalAccessException(String.format("Class [%s] is not the subClass of [%s]",clazz.getName(),type
                    .getName()));
        }
        //load wrapperClasses
        if (isWrappered(clazz)){
            wrapperClass.add(clazz);
        }
        classMap.put(name,clazz);
    }

    /**
     * parse one line to Pair which was splited by '='
     * @return Pair which key is left of '=' ,value is right of '='
     */
    private Pair<String,String> parseText (String line){
        int index = -1;
        if ((index = line.indexOf('#')) >= 0) line = line.substring(0,index);
        if (StringUtils.isEmpty(line)){
            return null;
        }
        String[] arr = SPI_NAME_REGEX.split(line);
        if (arr.length < 2){
            throw new IllegalArgumentException("spi file content error");
        }
        if (!StringUtils.hasText(arr[0])||!StringUtils.hasText(arr[1])){
            throw new IllegalArgumentException("spi file content error");
        }
        return new Pair<>(arr[0],arr[1]);
    }

    private boolean isWrappered(Class<?> clazz){
        try {
            clazz.getConstructor(type);
        } catch (NoSuchMethodException e) {
            return false;
        }
        return true;
    }

    private T getOrCreateInstance (String id){
        T instance = null;
        Class<?> clazz = this.extensionClass.get(id);
        if (clazz == null){
            throw new NullPointerException(String.format("[%s] not exist in " +
                    "%s implements!",id,type.getName()));
        }
        try {
            instance = getSingletonById(id);
        } catch (InstantiationException|IllegalAccessException e ) {
            logger.error("get Class Error,{}",e);
        }
        if (wrapperClass.size() > 0){
            try {
                for (Class<?> clz:wrapperClass){
                    instance = (T) clz.getConstructor(type).newInstance(instance);
                }
            } catch (Throwable t) {
                logger.error("Wrappered Class Load error,{}",t);
            }
        }
        return instance;
    }

    private T getSingletonById (String id) throws IllegalAccessException, InstantiationException {
        T instance = singletone.get(id);
        if (instance == null){
            Class<?> clazz = extensionClass.get(id);
            singletone.putIfAbsent(id,(T) clazz.newInstance());
            instance = singletone.get(id);
        }
        return instance;
    }

    private static <T> void checkInterfaceType(Class<T> type){
        if (type == null){
            failThrows(type,"can't be null");
        }
        if (!type.isInterface()){
            failThrows(type,"is't an interface");
        }
        if (!isSPIType(type)){
            failThrows(type,"without @SPI annotation");
        }
    }

    private static <T> boolean isSPIType(Class<T> clazz){
        return clazz.isAnnotationPresent(SPI.class);
    }

    private static <T> void failThrows (Class<T> type,String msg){
        throw new RuntimeException(String.format("%s:%s",type.getName(),msg));
    }

    private T initDefaultExtension (){
        SPI spi = type.getAnnotation(SPI.class);
        if(StringUtils.isEmpty(spi.value())){
            throw new NullPointerException(String.format("[%s] don't have default extension",type.getName()));
        }
        T t = getOrCreateInstance(spi.value());
        try{
            lock.lock();
            if (defaultInstance == null){
                defaultInstance = new Holder<>();
                defaultInstance.set(t);
            }
            if (defaultClass == null){
                defaultClass = new Holder<>();
                defaultClass.set(extensionClass.get(spi.value()));
            }
        } finally {
            lock.unlock();
        }

        return t;
    }

    public Map<String,T> getExtensionAllClasses(){
        return singletone;
    }

    public Set<String> getSupportExtension (){
        return this.extensionClass.keySet();
    }
}
