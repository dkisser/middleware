package org.wc.webserver.utils;

import org.wc.prettydog.util.StringUtils;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

/**
 * Created by WenChen on 2019/12/30.
 */
public class NetUtils {

    private static volatile String SERVER_IP = "";

    public static String getServerIp(){
        if (!StringUtils.hasText(SERVER_IP)){
            synchronized (SERVER_IP){
                if (!StringUtils.hasText(SERVER_IP)){
                    SERVER_IP = doGetServerIp();
                }
            }
        }
        return SERVER_IP;
    }

    private static String doGetServerIp(){
        String local = "127.0.0.1";
        try {
            Enumeration<NetworkInterface> networks = NetworkInterface.getNetworkInterfaces();
            InetAddress ip;
            while(networks.hasMoreElements()){
                NetworkInterface networkInterface = networks.nextElement();
                if (networkInterface.isLoopback()||networkInterface.isVirtual()||!networkInterface.isUp()){
                    continue;
                }
                Enumeration<InetAddress> address = networkInterface.getInetAddresses();
                while (address.hasMoreElements()){
                    ip = address.nextElement();
                    if (ip!=null&&ip instanceof Inet4Address){
                        local = ip.getHostAddress();
                        return local;
                    }
                }
            }
        } catch (SocketException e) {
            throw new RuntimeException("can't get server ip",e);
        }
        return local;
    }
}
