package org.wc.prettydog.mselect;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import org.wc.prettydog.mselect.exception.IllegalURLException;
import org.wc.prettydog.util.StringUtils;

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

    private String group;

    private String ip;

    private String port;

    private String protocol;

    private Map<String,String> arguments;

    private volatile String identifyStr = "";

    private static final String ROOT_PATH = "/pretty/@group@/";

    public URL() {
        arguments = new ConcurrentHashMap<>(16);
    }

    public URL addArgument (String key, String value){
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

    public String getIp() {
        return ip;
    }

    public URL setIp(String ip) {
        this.ip = ip;
        return this;
    }

    public String getPort() {
        return port;
    }

    public URL setPort(String port) {
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

    public Map<String, String> getArguments() {
        return arguments;
    }

    public URL setArguments(Map<String, String> arguments) {
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

    private void checkValid(){
        checkStringHasText(group,"group");
        checkStringHasText(port,"port");
        if (!StringUtils.isPositiveInteger(port)){
            throw new IllegalURLException("port must be positive integer");
        }
        checkStringHasText(protocol,"protocol");
    }

    private String getArgumentStr(){
        StringBuilder sb = new StringBuilder(32);
        if (arguments!=null){
            for(Map.Entry<String,String> entry:arguments.entrySet()){
                sb.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
            }
            sb.setLength(sb.length()-1);
        }
        return sb.toString();
    }

    private void doGetIdentify(){
        checkValid();
        StringBuilder sb = new StringBuilder(64);
        sb.append(protocol).append("://").append(group).append("@");
        String ipStr = "127.0.0.1";
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
        this.identifyStr = sb.toString();
    }

    private static void parseWithoutArg(String str,URL url){
        if (!StringUtils.hasText(str)){
            return;
        }
        Pattern P = Pattern.compile("(.*?)://(.*?)@(\\d{1,3}(\\.\\d{1,3}){3,5}):(\\d{1,5})");
        Matcher m = P.matcher(str);
        if (m.matches() && m.groupCount() == 5){
            url.setProtocol(m.group(1))
                    .setGroup(m.group(2))
                    .setIp(m.group(3))
                    .setPort(m.group(5));
        }
    }

    private static void parseWithArg(String str,URL url){
        if (!StringUtils.hasText(str)){
            return;
        }
        String[] arr = str.split("&");
        for (String s: arr){
            String[] a = s.split("=");
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

    public String getRegistListPath (){
        return getListPath()+getIdentifyStr();
    }

    public String getListPath(){
        return ROOT_PATH.replace("@group@",group)+"list/";
    }

    public String getRegistMasterPath(){
        return getMasterPath()+getIdentifyStr();
    }

    public String getMasterPath(){
        return ROOT_PATH.replace("@group@",group)+"master/";
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
        if ( StringUtils.hasText(port) && StringUtils.hasText(group)){
            sb.append("://").append(group).append("@");
            if (StringUtils.hasText(ip)){
                sb.append(ip);
            } else {
                sb.append("127.0.0.1");
            }
            sb.append(":").append(port);
        }
        if (arguments != null){
            sb.append("?");
            for (Map.Entry<String,String> entry: arguments.entrySet()){
                sb.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
            }
            sb.setLength(sb.length()-1);
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String str1 = "redis://group@127.0.0.1:1120";
        String str = "redis://asdf@127.0.0.1:1120?test1=tesst1dsdsds&test2=test2strr";
        URL u = valueOf(str1);
        URL u1 = valueOf(str);
        System.out.println(u1.getIdentifyStr());
        System.out.println(u1.getRegistListPath());
    }
}
