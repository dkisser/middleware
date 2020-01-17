package org.wc.tinycat.server.netty;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelDuplexHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelPromise;
import io.netty.util.ReferenceCountUtil;

/**
 * Created by WenChen on 2020/1/2.
 */
public class PringServerHandler extends ChannelDuplexHandler {

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        ByteBuf buf = (ByteBuf) msg;
        String str = null;
        try {
            byte[] temp = new byte[buf.readableBytes()];
            buf.readBytes(temp);
            str = new String (temp,"GBK");
            String returnMsg = "server return:"+str+"\r\n";
            ByteBuf b = Unpooled.buffer();
            b.writeBytes(returnMsg.getBytes());
            System.out.println("server recive:"+str);
            ctx.writeAndFlush(b);
        } finally {
            ReferenceCountUtil.release(msg);
        }
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        cause.printStackTrace();
        ctx.close();
    }

    @Override
    public void write(ChannelHandlerContext ctx, Object msg, ChannelPromise promise) throws Exception {
        super.write(ctx, msg, promise);
    }
}
