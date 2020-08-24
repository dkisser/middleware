package org.wc.midware.transporter.netty;

import io.netty.bootstrap.Bootstrap;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.PooledByteBufAllocator;
import io.netty.buffer.Unpooled;
import io.netty.buffer.UnpooledByteBufAllocator;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.ByteToMessageDecoder;
import io.netty.handler.codec.LengthFieldBasedFrameDecoder;
import io.netty.handler.codec.LengthFieldPrepender;
import io.netty.handler.codec.MessageToByteEncoder;
import io.netty.handler.codec.bytes.ByteArrayEncoder;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.ThreadFactory;

/**
 * Created by WenChen on 2020/8/10.
 */
public class NettyServerTest {

    private NioEventLoopGroup boss;

    private NioEventLoopGroup woker;

    private static ServerBootstrap bootstrap;

    private static Channel serverChannel;

    private static final Integer WOKER_COUNT = 10;

    private static final Integer MAX_FRAME_LENGTH = 1024*4;

    public NettyServerTest() {
        init();
    }

    public void init(){
        boss = new NioEventLoopGroup(1, r -> {return new Thread(r,"bossThread");});
        woker = new NioEventLoopGroup(WOKER_COUNT, r -> {return new Thread(r,"wokerThread");});
        bootstrap = new ServerBootstrap();
        bootstrap.group(boss,woker);
        NettyServerHandler serverHandler = new NettyServerHandler();
        bootstrap.channel(NioServerSocketChannel.class)
                .childOption(ChannelOption.TCP_NODELAY, Boolean.TRUE)
                .childOption(ChannelOption.SO_REUSEADDR, Boolean.TRUE)
                .childOption(ChannelOption.ALLOCATOR, PooledByteBufAllocator.DEFAULT)
                .childHandler(new ChannelInitializer<NioSocketChannel>() {
                    @Override
                    protected void initChannel(NioSocketChannel nioServerSocketChannel) throws Exception {
                        nioServerSocketChannel.pipeline()
                                .addLast("decoder",new LengthFieldBasedFrameDecoder(MAX_FRAME_LENGTH,0,8,0,8))
                                .addLast("encode", new LengthFieldPrepender(8))
                                .addLast("handler",serverHandler);

                    }
                });
    }

    public void start(Integer port){
        ChannelFuture future = bootstrap.bind(port).syncUninterruptibly();
        serverChannel = future.channel();
    }

    public static void main(String[] args) {
        NettyServerTest server = new NettyServerTest();
        server.start(8080);

    }

    class NettyServerHandler extends ChannelInboundHandlerAdapter{

        @Override
        public void channelActive(ChannelHandlerContext ctx) throws Exception {
            super.channelActive(ctx);
        }

        @Override
        public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
            if (msg instanceof ByteBuf){
                ByteBuf buf = (ByteBuf) msg;
                byte[] arr = new byte[buf.readableBytes()];
                buf.readBytes(arr);
                System.out.println("receive:"+new String(arr));
            }
            ctx.writeAndFlush(Unpooled.copiedBuffer("received msg...".getBytes()));
        }

    }

}
