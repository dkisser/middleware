package org.wc.tinycat.server.netty;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.handler.codec.Delimiters;
import io.netty.handler.codec.LengthFieldBasedFrameDecoder;
import io.netty.handler.codec.LineBasedFrameDecoder;

import java.nio.ByteOrder;

/**
 * Created by WenChen on 2020/1/2.
 */
public class NettServerTest {

    private static final int port = 19997;

    public static void main(String[] args) {
        EventLoopGroup boss = new NioEventLoopGroup();
        EventLoopGroup worker = new NioEventLoopGroup();
        try {
            ServerBootstrap strap = new ServerBootstrap();
            strap.group(boss,worker)
                    .channel(NioServerSocketChannel.class)
                    .childHandler(new ChannelInitializer<SocketChannel>() {
                        @Override
                        protected void initChannel(SocketChannel socketChannel) throws Exception {
                            socketChannel.pipeline()
                                    //\r\n splite
//                                    .addLast("decoder",new DelimiterBasedFrameDecoder(Integer.MAX_VALUE, Delimiters.lineDelimiter()[0]))
                                    .addLast("decoder",new LengthFieldBasedFrameDecoder(Integer.MAX_VALUE,
                                            0,4,0,4))
                                    .addLast("handler",new PringServerHandler());
                        }
                    })
                    .option(ChannelOption.SO_BACKLOG,128)
                    .option(ChannelOption.SO_RCVBUF,4*1024)
                    .option(ChannelOption.SO_SNDBUF,4*1024)
                    .childOption(ChannelOption.SO_KEEPALIVE,true);
            ChannelFuture future = strap.bind(port).sync();
            future.channel();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
//            worker.shutdownGracefully();
//            boss.shutdownGracefully();
        }
    }

}
