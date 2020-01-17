package org.wc.tinycat.server.netty;

import io.netty.buffer.ByteBuf;
import org.wc.webserver.protocol.tcp.netty.decoder.CustomTcpDecoder;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by WenChen on 2020/1/10.
 */
public class DefaultCustomTcpDecoder implements CustomTcpDecoder{

    private AtomicInteger count = new AtomicInteger();

    @Override
    public Object decode(ByteBuf buf) {
        byte[] temp = new byte[buf.readableBytes()];
        buf.readBytes(temp);
        System.out.println("数据："+new String(temp));
        System.out.println("当前数量："+buf.readableBytes());
        System.out.println("当前回调次数："+count.getAndIncrement());
        return null;
    }
}
