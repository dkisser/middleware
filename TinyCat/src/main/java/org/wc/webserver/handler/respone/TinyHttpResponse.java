package org.wc.webserver.handler.respone;

import org.wc.webserver.handler.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

/**
 * Created by WenChen on 2019/5/16.
 */
public class TinyHttpResponse implements HttpServletResponse {

    private OutputStream out;

    public TinyHttpResponse(OutputStream out) {
        this.out = out;
    }

    public String handleRespone(String responeStr) {
        return "HTTP/1.1 200 OK\r\n"
                +"Date "+new Date()+"\r\n"
                +"Content-Type: text/html;charset=UTF-8\r\n"
                +"Content-Length: "+(responeStr.length()+85-19-5)+"\r\n\r\n"
                +"<html>"
                +"<head><title>TinyCat</title></head>"
                + "<body>" +responeStr
                +"</body></html>";
    }

    public String respone(String responeStr) {
        try {
            out.write(handleRespone(responeStr).getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "HTTP/1.1 200 OK\r\n"
                +"Date "+new Date()+"\r\n"
                +"Content-Type: text/html;charset=UTF-8\r\n"
                +"Content-Length: 85\r\n\r\n"
                +"<html>"
                +"<head><title>TinyCat</title></head>"
                + "<body>" +responeStr
                +"</body></html>";
    }

}
