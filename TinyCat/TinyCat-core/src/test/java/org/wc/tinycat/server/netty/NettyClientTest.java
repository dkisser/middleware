package org.wc.tinycat.server.netty;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.bytes.ByteArrayEncoder;


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
//                                .addLast("stringEncoder",new StringEncoder())
                                .addLast(new ByteArrayEncoder())
//                                .addLast("decoder",new DelimiterBasedFrameDecoder(Integer.MAX_VALUE, Delimiters.lineDelimiter()[0]))
                                .addLast("handler",new ClientHandlerTest());
                    }
                });
            bootstrap.connect("localhost",19997)
                    .syncUninterruptibly().channel();



    }
}
