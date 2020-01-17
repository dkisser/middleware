package org.wc.tinycat.server;

import org.junit.After;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

/**
 * Created by WenChen on 2020/1/2.
 */
public class TcpMsgSender {

    private static final int port = 19997;

    private static final String host = "127.0.0.1";

    private Socket socket;

    @Test
    public void sendTcpMsg (){
        try {
            for (int i=0;i<20;i++){
                socket = new Socket(host,port);
                String req = "{\"test\":111}\r\n";
                OutputStream out = socket.getOutputStream();
                out.write(req.getBytes());
                InputStream in = socket.getInputStream();
                byte[] temp = new byte[100];
                StringBuilder sb = new StringBuilder(100);
                int index;
                if((index = in.read(temp))!=-1){
                    sb.append(new String(temp,0,index));
                }
                System.out.println(sb.toString());
                in.close();
                out.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @After
    public void after(){
        try {
            if (socket!=null){
                socket.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
