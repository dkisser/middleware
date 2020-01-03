package org.wc.tinycat.server.netty;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelDuplexHandler;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;

import java.nio.charset.Charset;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * Created by WenChen on 2020/1/3.
 */
@ChannelHandler.Sharable
public class ClientHandlerTest extends ChannelDuplexHandler {

    private ScheduledExecutorService executor = Executors.newScheduledThreadPool(1,r->new Thread(r,
                                                                                                         "heartThread"));
    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        if (msg instanceof ByteBuf) {
            String value = ((ByteBuf) msg).toString(Charset.defaultCharset());
            System.out.println(value);
        }
        //把客户端的通道关闭
        ctx.channel().close();
    }

    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        super.channelActive(ctx);
        System.out.println("client connect");
        executor.scheduleAtFixedRate(()->ctx.channel().writeAndFlush("hello\r\n")
                ,100,2000,TimeUnit.MICROSECONDS);
    }
}
