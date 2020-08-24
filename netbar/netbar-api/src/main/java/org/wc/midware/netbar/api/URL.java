package org.wc.midware.netbar.api;

/**
 * Created by WenChen on 2020/8/5.
 */

import org.wc.prettydog.mselect.exception.IllegalURLException;
import org.wc.prettydog.util.StringUtils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.wc.prettydog.util.NetUtil.IP_PATTERN;
import static org.wc.prettydog.util.NetUtil.getServerIp;

/**
 * Created by WenChen on 2020/6/18.
 */
public class URL {

    private String serviceId;

    private String impl;

    private String group;

    private String version;

    private String ip;

    private Integer port;

    private String protocol;

    private Map<String,Object> arguments;

    private volatile String identifyStr = "";

    public static final String ROOT_PATH = "/netbar/@serviceId@/";

    private static final Pattern URL_PATTERN = Pattern.compile("(.*?)://(\\d{1,3}(\\.\\d{1,3}){3,5}):(\\d{1,5})");

    private static final String DEFAULT_VERSION_VALUE="default";

    private static final String DEFAULT_GROUP_VALUE="default";

    public URL() {
        arguments = new ConcurrentHashMap<>(16);
    }

    public URL addArgument (String key, Object value){
        arguments.put(key,value);
        return this;
    }

    public String getGroup() {
        return group;
    }

    public URL setGroup(String group) {
        this.group = group;
        return this;
    }

    public String getServiceId() {
        return serviceId;
    }

    public URL setServiceId(String serviceId) {
        this.serviceId = serviceId;
        return this;
    }

    public String getVersion() {
        return version;
    }

    public URL setVersion(String version) {
        this.version = version;
        return this;
    }

    public String getIp() {
        return ip;
    }

    public URL setIp(String ip) {
        this.ip = ip;
        return this;
    }

    public Integer getPort() {
        return port;
    }

    public URL setPort(Integer port) {
        this.port = port;
        return this;
    }

    public String getProtocol() {
        return protocol;
    }

    public URL setProtocol(String protocol) {
        this.protocol = protocol;
        return this;
    }

    public String getImpl() {
        return impl;
    }

    public URL setImpl(String impl) {
        this.impl = impl;
        return this;
    }

    public Map<String, Object> getArguments() {
        return arguments;
    }

    public URL setArguments(Map<String, Object> arguments) {
        this.arguments = arguments;
        return this;
    }

    public String getIdentifyStr() {
        if (!StringUtils.hasText(identifyStr)){
            synchronized (identifyStr){
                if (!StringUtils.hasText(identifyStr)){
                    doGetIdentify();
                }
            }
        }
        return identifyStr;
    }

    private void checkStringHasText(String str,String value){
        if (!StringUtils.hasText(str)){
            throw new IllegalURLException(String.format("%s can't be null or empty string",value));
        }
    }

    private boolean isPositiveInteger(Integer i){
        return i>=0;
    }

    private void checkValid(){
        checkStringHasText(port.toString(),"port");
        if (!isPositiveInteger(port)){
            throw new IllegalURLException("port must be positive integer");
        }
        checkStringHasText(protocol,"protocol");
        checkStringHasText(serviceId,"serviceId");
        checkStringHasText(impl,"impl");
    }

    private String getArgumentStr(){
        StringBuilder sb = new StringBuilder(32);
        if (arguments!=null && arguments.size() > 0){
            for(Map.Entry<String,Object> entry:arguments.entrySet()){
                sb.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
            }
            sb.setLength(sb.length()-1);
        }
        return sb.toString();
    }

    private String getServiceIdAndGroupAndVersion(){
        StringBuilder sb = new StringBuilder();
        if (!StringUtils.hasText(ip) || !isPositiveInteger(port)){
            return sb.toString();
        }
        if (!StringUtils.hasText(group)){
            this.setGroup(DEFAULT_GROUP_VALUE);
        }
        if (!StringUtils.hasText(version)){
            this.setVersion(DEFAULT_VERSION_VALUE);
        }
        sb.append("&serviceId=").append(serviceId).append("&impl=").append(impl)
            .append("&group=").append(group).append("&version=").append(version);
        return sb.toString();
    }

    private void doGetIdentify(){
        checkValid();
        StringBuilder sb = new StringBuilder(64);
        sb.append(protocol).append("://");
        String ipStr;
        if (StringUtils.isNotEmpty(ip)){
            if(IP_PATTERN.matcher(ip).matches()){
                ipStr = ip;
            } else {
                throw new IllegalURLException("ip is not valid");
            }
        } else {
            ipStr = getServerIp();
        }
        sb.append(ipStr).append(":").append(port);
        if(arguments != null && arguments.size()>0){
            sb.append("?");
        }
        sb.append(getArgumentStr());
        sb.append(getServiceIdAndGroupAndVersion());
        this.identifyStr = sb.toString();
    }

    private static void parseWithoutArg(String str,URL url){
        if (!StringUtils.hasText(str)){
            return;
        }
        Matcher m = URL_PATTERN.matcher(str);
        if (m.matches() && m.groupCount() == 4){
            try {
                url.setProtocol(m.group(1))
                        .setIp(m.group(2))
                        .setPort(Integer.parseInt(m.group(4)));
            } catch (NumberFormatException e){
                throw new IllegalArgumentException("port must be positive integer");
            }
        } else {
            throw new IllegalArgumentException("host or port invalid");
        }
    }

    private static void parseWithArg(String str,URL url){
        if (!StringUtils.hasText(str)){
            return;
        }
        String[] arr = str.split("&");
        for (String s: arr){
            String[] a = s.split("=");
            if("group".equals(a[0])){
                url.setGroup(a[1]);
                continue;
            }
            if("version".equals(a[0])){
                url.setVersion(a[1]);
                continue;
            }
            if("serviceId".equals(a[0])){
                url.setServiceId(a[1]);
                continue;
            }
            if("impl".equals(a[0])){
                url.setImpl(a[1]);
                continue;
            }
            url.addArgument(a[0],a[1]);
        }
    }

    public static URL valueOf(String str){
        URL url = new URL();
        if (!str.contains("?")){
            parseWithoutArg(str,url);
        } else {
            int index = str.indexOf("?");
            parseWithoutArg(str.substring(0,index),url);
            parseWithArg(str.substring(index+1),url);
        }
        return url;
    }

    public String getIpAndPortStr(){
        return ip+":"+port;
    }

    public String getArgument(String key,String def){
        Object result = arguments.get(key);
        if (result != null){
            return (String) result;
        }
        return def;
    }

    public Integer getIntArgumentOrDefault(String key,Integer def){
        Object result = arguments.get(key);
        if (result != null){
            return (Integer) result;
        }
        return def;
    }

    public String getEnCodePath (){
        try {
            return URLEncoder.encode(getIdentifyStr(),"UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public static URL deCodeAndGet (String str){
        try {
            String urlStr = URLDecoder.decode(str,"UTF-8");
            return URL.valueOf(urlStr);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getServiceKey(){
        StringBuilder sb = new StringBuilder(100);
        if(!StringUtils.hasText(group)){
            sb.append("default");
        } else {
            sb.append(group);
        }
        sb.append("/").append(serviceId).append("/");
        if(!StringUtils.hasText(version)){
            sb.append("default");
        } else {
            sb.append(version);
        }
        sb.append("/").append(port);
        return sb.toString();
    }

    public String getConsumerInfo(){
        StringBuilder sb = new StringBuilder(64);
        sb.append(group).append("/").append(serviceId).append("/");
        sb.append(version);
        return sb.toString();
    }

    public String getProviderInfo(){
        StringBuilder sb = new StringBuilder(100);
        sb.append(group).append("/").append(serviceId).append("/")
                .append(version).append("/").append(ip).append("/").append(port);
        return sb.toString();
    }

    public String getSubcribePath(String path){
        StringBuilder sb = new StringBuilder();
        String s = ROOT_PATH.substring(0);
        String rp = s.replace("@serviceId@",serviceId);
        sb.append(rp).append(path);
        return sb.toString();
    }

    public String getRegistPath(String path){
        StringBuilder sb = new StringBuilder(150);
        String s = ROOT_PATH.substring(0);
        String rp = s.replace("@serviceId@",serviceId);
        sb.append(rp).append(path).append("/").append(getEnCodePath());
        return sb.toString();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof URL){
            URL url = (URL) obj;
            return url.getIdentifyStr().equals(getIdentifyStr());
        }
        return false;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder(64);
        if(StringUtils.hasText(protocol)){
            sb.append(protocol);
        }
        if (isPositiveInteger(port)){
            sb.append("://");
            if (StringUtils.hasText(ip)){
                sb.append(ip);
            } else {
                sb.append("127.0.0.1");
            }
            sb.append(":").append(port);
        }
        if (arguments != null && arguments.size() > 0){
            sb.append("?");
        }
        sb.append(getArgumentStr());
        sb.append(getServiceIdAndGroupAndVersion());
        return sb.toString();
    }

}
