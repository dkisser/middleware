package org.wc.prettydog.util;

import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;
import java.util.regex.Pattern;

/**
 * Created by WenChen on 2020/6/18.
 */
public class NetUtil {

    private static final Logger logger = LoggerFactory.getLogger(NetUtil.class);

    private static volatile String SERVER_IP = "";

    private static String LOCALHOST="127.0.0.1";

    private static String ANYHOST="0.0.0.0";

    public static Pattern IP_PATTERN= Pattern.compile("\\d{1,3}(\\.\\d{1,3}){3,5}$");

    public static String getServerIp(){
        if (!StringUtils.hasText(SERVER_IP)){
            synchronized(SERVER_IP){
                if(!StringUtils.hasText(SERVER_IP)){
                    doGetServerIp();
                }
            }
        }
        return SERVER_IP;
    }

    private static boolean checkIp(InetAddress address){
        if (address == null || address.isLoopbackAddress())
            return false;
        String ip = address.getHostAddress();
        return (ip != null && !LOCALHOST.equals(ip)
                && !ANYHOST.equals(ip) && IP_PATTERN.matcher(ip).matches());
    }

    private static void doGetServerIp(){
        try{
            InetAddress localhost = InetAddress.getLoopbackAddress();
            if (checkIp(localhost)){
                SERVER_IP = localhost.getHostAddress();
            }
            Enumeration<NetworkInterface> network = NetworkInterface.getNetworkInterfaces();
            if (network != null){
                while (network.hasMoreElements()) {
                    NetworkInterface in = network.nextElement();
                    Enumeration<InetAddress> adresses = in.getInetAddresses();
                    if(adresses!=null){
                        while(adresses.hasMoreElements()){
                            InetAddress ad = adresses.nextElement();
                            if (checkIp(ad)) {
                                SERVER_IP = ad.getHostAddress();
                                return;
                            }
                        }
                    }
                }
            }
            SERVER_IP = localhost.getHostAddress();
        } catch (Throwable t){
            logger.warn(t);
        }

    }

    public static void main(String[] args) {
        System.out.println(getServerIp());
    }
}
