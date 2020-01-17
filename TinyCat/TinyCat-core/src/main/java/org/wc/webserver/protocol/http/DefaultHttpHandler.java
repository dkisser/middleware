package org.wc.webserver.protocol.http;

import org.wc.webserver.support.RequestResponseModel;

import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by WenChen on 2019/12/30.
 */
public class DefaultHttpHandler implements HttpHandler {

    @Override
    public void handler(HttpServletRequest request, HttpServletResponse response) {
        StringBuilder sb = new StringBuilder(100);
        try {
            ServletInputStream reqStr = request.getInputStream();
            byte[] temp = new byte[10];
            int index ;
            while ((index = reqStr.read(temp))!=-1){
                sb.append(new String(temp,0,index));
            }
            reqStr.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(sb.toString());
        try {
            ServletOutputStream out = response.getOutputStream();
            out.write(sb.toString().getBytes());
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void handler(RequestResponseModel model) {

    }
}
