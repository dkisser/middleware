package org.wc.prettydog;

import org.junit.Test;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.ReadableByteChannel;

/**
 * Created by WenChen on 2019/11/12.
 */
public class ResourceTest {

    @Test
    public void testResource (){
        Resource resource = new FileSystemResource("d:\\byb_20180112.sql");
        ReadableByteChannel channel = null;
        try {
            StringBuilder resultSb = new StringBuilder(200);
            channel = resource.readableChannel();
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
}
