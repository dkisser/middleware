package org.wc.webserver.protocol.tcp.netty.decoder;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;
import org.wc.prettydog.support.ExtensionLoader;
import org.wc.webserver.support.ServerModule;

import java.util.List;

/**
 * Created by WenChen on 2020/1/9.
 */
public class CustomTcpDecoderDelegate extends ByteToMessageDecoder{

    private CustomTcpDecoder decoder;

    public CustomTcpDecoderDelegate(ServerModule module) {
        this.decoder = ExtensionLoader.getExtensionLoader(CustomTcpDecoder.class)
                .getExtensionById(module.getAttribute("decoder"));
    }

    @Override
    protected void decode(ChannelHandlerContext channelHandlerContext, ByteBuf byteBuf, List<Object> list) throws
            Exception {
        Object b = decoder.decode(byteBuf);
        if (b != null){
            list.add(b);
        }
    }
}
