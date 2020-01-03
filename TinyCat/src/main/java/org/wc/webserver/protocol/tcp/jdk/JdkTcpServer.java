package org.wc.webserver.protocol.tcp.jdk;

import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.webserver.protocol.tcp.AbstractTcpServer;
import org.wc.webserver.protocol.tcp.TcpHandler;
import org.wc.webserver.protocol.tcp.TcpServer;
import org.wc.webserver.support.ServerModule;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Arrays;
import java.util.concurrent.*;

/**
 * Created by WenChen on 2020/1/2.
 */
public class JdkTcpServer extends AbstractTcpServer{

    private static final Logger logger = LoggerFactory.getLogger(JdkTcpServer.class);

    private ServerSocket server;

    public JdkTcpServer(ServerModule module,TcpHandler handler) {
        super(handler);
        try {
            server = new ServerSocket(module.getPort());
            Thread thread = new Thread(new TcpServerTask(server,handler),"TinnyCat-tcpServer-MainThread");
            thread.setDaemon(true);
            thread.start();
            logger.info("tcp server start");
        } catch (IOException e) {
            throw new RuntimeException("tcp server start faild",e);
        }
    }

    @Override
    public void close() {
        super.close();
        try {
            server.close();
        } catch (IOException e) {
            logger.error("close server error",e);
        }
    }

    class TcpServerTask implements Runnable{

        private ServerSocket server;

        private TcpHandler handler;

        public TcpServerTask(ServerSocket server,TcpHandler handler) {
            this.server = server;
            this.handler = handler;
        }

        @Override
        public void run() {
            while(true){
                InputStream in = null;
                OutputStream out = null;
                try {
                    Socket socket = server.accept();
                    in = socket.getInputStream();
                    byte[] recv = null;
                    byte[] temp = new byte[100];
                    int index;
                    if((index = in.read(temp)) != -1){
                        if (recv == null){
                            recv = Arrays.copyOfRange(temp,0,index);

                        }
//                    byte[] _new = new byte[recv.length+index+1];
//                    System.arraycopy(recv,0,_new,0,recv.length);
//                    System.arraycopy(temp,0,_new,recv.length,index+1);
//                    recv = _new;
                    }
                    byte[] resp = handler.handler(recv);
                    out = socket.getOutputStream();
                    out.write(resp);
                    socket.close();
                } catch (IOException e) {
                    logger.error("recieve socket error",e);
                } finally {
                    if (out != null){
                        try {
                            out.close();
                        } catch (IOException e) {
                            logger.error("close outputStream error");
                        }
                    }
                    if (in != null){
                        try {
                            in.close();
                        } catch (IOException e) {
                            logger.error("close inputStream error");
                        }
                    }
                }
            }
        }
    }

}
