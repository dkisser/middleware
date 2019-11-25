package org.wc.prettydog.spring;

import org.junit.Test;
import org.springframework.core.io.*;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.ReadableByteChannel;

/**
 * 使用NIO读写文件
 * Created by WenChen on 2019/11/12.
 */
public class ResourceTest {

    @Test
    public void testResource (){
        Resource resource = new FileSystemResource("d:\\byb_20180112.sql");
        try {
            ReadableByteChannel channel = resource.readableChannel();
            readChannel(channel);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void readChannel (ReadableByteChannel channel){
        try {
            StringBuilder resultSb = new StringBuilder(200);
            ByteBuffer buffer = ByteBuffer.allocate(1024);
            int index=0,buffSize=buffer.capacity();
            while ((index=channel.read(buffer))!=-1){
                buffer.flip();
                byte[] temp=null;
                if (index < buffSize -1){
                    temp = new byte[index+1];
                    System.arraycopy(buffer.array(),0,temp,0,index+1);
                } else {
                    temp = buffer.array();
                }
                resultSb.append(new String(temp,"UTF-8"));
                buffer.clear();
            }
            System.out.println(resultSb.toString());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (channel != null){
                try {
                    channel.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * DefaultResourceLoader不适合在window下使用，要是要用，需要DefaultResourceLoader.addProtocolResolver
     * 然后手动实现ProtocolResolver.resolve方法
     */
    @Test
    public void testResourceLoader (){
        DefaultResourceLoader resourceLoader = new DefaultResourceLoader();
        resourceLoader.addProtocolResolver((s,resourceLoader1) -> new FileSystemResource(s));
        try {
            ReadableByteChannel channel = resourceLoader
                    .getResource("d:\\byb_20180112.sql").readableChannel();
            readChannel(channel);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
