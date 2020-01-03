package org.wc.tinycat.server.netty;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.handler.codec.Delimiters;
import io.netty.handler.codec.string.StringEncoder;
import io.netty.util.AttributeKey;
import jdk.management.resource.ResourceType;


/**
 * Created by WenChen on 2020/1/2.
 */
public class NettyClientTest {

    public static void main(String[] args) {
        EventLoopGroup worker = new NioEventLoopGroup();
        Bootstrap bootstrap = new Bootstrap();
        bootstrap.group(worker)
                .option(ChannelOption.SO_SNDBUF,1024*4)
                .option(ChannelOption.SO_RCVBUF,1024*4)
                .channel(NioSocketChannel.class)
                .handler(new ChannelInitializer<NioSocketChannel>() {
                    @Override
                    protected void initChannel(NioSocketChannel socketChannel) throws Exception {
                        socketChannel.pipeline()
                                .addLast("stringEncoder",new StringEncoder())
                                .addLast("decoder",new DelimiterBasedFrameDecoder(Integer.MAX_VALUE, Delimiters.lineDelimiter()[0]))
                                .addLast("handler",new ClientHandlerTest());;
                    }
                });
            bootstrap.connect("localhost",19997)
                    .syncUninterruptibly().channel();



    }
}
