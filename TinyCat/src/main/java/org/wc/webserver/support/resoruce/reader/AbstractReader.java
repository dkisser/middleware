package org.wc.webserver.support.resoruce.reader;

import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;

import javax.sound.midi.Soundbank;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.rmi.UnexpectedException;
import java.util.Enumeration;

/**
 * Created by WenChen on 2019/12/27.
 */
public abstract class AbstractReader implements Reader{

    private volatile String serverIp;

    @Override
    public String serverIp() {
        if (serverIp == null){
            serverIp = doGetServIp();
        }
        return serverIp;
    }

    private String doGetServIp(){
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
