package org.wc.webserver.protocol.tcp.netty;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelDuplexHandler;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.util.ReferenceCountUtil;
import org.wc.webserver.protocol.tcp.TcpHandler;

/**
 * Created by WenChen on 2020/1/3.
 */
@ChannelHandler.Sharable
public class TcpChannelHandlerDelegate extends ChannelDuplexHandler {

    private TcpHandler handler;

    public TcpChannelHandlerDelegate(TcpHandler handler) {
        this.handler = handler;
    }

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        try {
            if (msg instanceof ByteBuf){
                ByteBuf req = (ByteBuf) msg;
                byte[] reqByte = new byte[req.readableBytes()];
                req.readBytes(reqByte);
                ctx.writeAndFlush(handler.handler(reqByte));
            }
        } finally {
            ReferenceCountUtil.release(msg);
        }
    }
}
