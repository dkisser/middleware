package org.wc.webserver.handler.request;

import io.netty.util.internal.StringUtil;
import org.wc.webserver.conf.ServerConfig;
import org.wc.webserver.handler.HttpServletRequest;

import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.SoftReference;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * Created by WenChen on 2019/5/16.
 *
 */
public class TinyHttpRequest implements HttpServletRequest{

    private InputStream inputStream;

    private String[] requestArray;

    private ConcurrentMap<String,SoftReference<String>> requestMap= new ConcurrentHashMap<>();

    public TinyHttpRequest(InputStream in) throws IOException {
        this.inputStream = in;
        handleRequest();

    }

    /**
     * 解析http协议
     * @return
     */
    private void handleRequest () throws IOException {
        StringBuilder requestSb = new StringBuilder(150);
        Integer http_buffer_size = ServerConfig.getInt(ServerConfig.ServerProp.HTTP_BUFFER,1024);
        byte [] buffer = new byte[http_buffer_size];
        int temp;
        if ((temp = inputStream.read(buffer)) > 0){
            requestSb.append(new String(buffer,0,temp));
        }
        if (requestSb.length() > 0){
            requestArray = requestSb.toString().split("\r\n");
        } else {
            requestArray = new String[0];
        }
    }

    public String getRequestURI() {
        return getString("uri");
    }

    public String getParameter(String paramName) {
        return null;
    }

    @Override
    public String getMethod() {
        return getString("method");
    }

    private String getString (String keyValue){
        SoftReference<String> reference = requestMap.getOrDefault(keyValue,null);
        if (reference == null){
            return resolveRequest(keyValue);
        }
        String value = reference.get();
        if (StringUtil.isNullOrEmpty(value)){
            //解析这个参数，然后再放入缓存，最后返回
            return resolveRequest(keyValue);
        }
        return value;
    }

    public enum HttpIndex {

        URI_METHOD(0,"uri|method"),
        HOST(1,"host"),
        AGENT(2,"agent"),
        ACCEPT(3,"accept"),
        REFEER(4,"referer"),
        ENCODE(5,"encode"),
        LANGUAGE(6,"language");

        private HttpIndex(int index, String key) {
            this.index = index;
            this.key = key;
        }

        private int index;

        private String key;

        public int getIndex (){
            return this.index;
        }

        public String getKey (){
            return this.key;
        }

        public static int getIndexByKey (String key){
            HttpIndex[] arr = HttpIndex.values();
            for (int i=0;i<arr.length;i++){
                if (arr[i].getKey().contains(key)){
                    return arr[i].getIndex();
                }
            }
            return -1;
        }

        public static String getKeyByIndex (int index){
            return HttpIndex.values()[index].getKey();
        }
    }

    private String resolveRequest (String keyValue){
        /**
         * 1.根据key找到array中对应的字符串
         * 2.解析出想要的参数
         * 3.返回
         */
        int index = HttpIndex.getIndexByKey(keyValue);
        switch (index){
            case 0:
                return resolveUri(index);
            case 1:
                return resolveHost(index);
            case 2:
                return resolveAgent(index);
            case 3:
                return resolveAccept(index);
            case 4:
                return resolveReferer(index);
            case 5:
                return resolveEncode(index);
            case 6:
                return resolvelanguage(index);
            default:
                return "";
        }
    }

    private String resolveUri (int index){
        if (requestArray.length == 0){
            return "";
        }
        String reqStr = requestArray[index];
        String[] arr = reqStr.split(" ");
        write2RequestMap("method",arr[0]);
        write2RequestMap("uri",arr[1]);
        return arr[1];
    }
    private String resolveHost (int index){
//        String reqStr = requestArray[index];
        write2RequestMap("host","host");
        return "host";
    }
    private String resolveAgent (int index){
//        String reqStr = requestArray[index];
        write2RequestMap("agent","agent");
        return "agent";
    }
    private String resolveAccept (int index){
//        String reqStr = requestArray[index];
        write2RequestMap("accept","accept");
        return "accept";
    }
    private String resolveReferer (int index){
//        String reqStr = requestArray[index];
        write2RequestMap("referer","referer");
        return "referer";
    }
    private String resolveEncode (int index){
//        String reqStr = requestArray[index];
        write2RequestMap("encode","encode");
        return "encode";
    }
    private String resolvelanguage (int index){
//        String reqStr = requestArray[index];
        write2RequestMap("language","language");
        return "language";
    }

    private void write2RequestMap (String key,String value){
        SoftReference<String> reference = new SoftReference<String>(value);
        requestMap.put(key,reference);
    }
}
