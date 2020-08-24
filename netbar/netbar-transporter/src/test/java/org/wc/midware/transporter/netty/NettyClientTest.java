package org.wc.midware.transporter.netty;

import io.netty.bootstrap.Bootstrap;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.PooledByteBufAllocator;
import io.netty.buffer.Unpooled;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.LengthFieldBasedFrameDecoder;
import io.netty.handler.codec.LengthFieldPrepender;
import org.junit.Before;
import org.junit.Test;

import java.io.BufferedReader;
import java.io.InputStreamReader;

/**
 * Created by WenChen on 2020/8/10.
 */
public class NettyClientTest {

    private EventLoopGroup boss;

    private static Bootstrap bootstrap;

    private static Channel channel;

    private BufferedReader reader;

    private static Integer MAX_FRAMNE_LENGTH = 1024*4;

    public NettyClientTest() {
        init();
    }

    public void init(){
        boss = new NioEventLoopGroup(1,r ->{return new Thread(r,"bossThread");});
        NettyClientHandler clientHandler = new NettyClientHandler();
        bootstrap = new Bootstrap();
        bootstrap.group(boss)
                .channel(NioSocketChannel.class)
                .option(ChannelOption.SO_KEEPALIVE, true)
                .option(ChannelOption.TCP_NODELAY, true)
                .option(ChannelOption.ALLOCATOR, PooledByteBufAllocator.DEFAULT)
                .handler(new ChannelInitializer<NioSocketChannel>() {
                    @Override
                    protected void initChannel(NioSocketChannel nioSocketChannel) throws Exception {
                        nioSocketChannel.pipeline()
                                    .addLast("encoder",new LengthFieldPrepender(8))
                                    .addLast("decoder",new LengthFieldBasedFrameDecoder(MAX_FRAMNE_LENGTH,0,8,0,8))
                                    .addLast("handler",clientHandler);
                    }
                });
        reader = new BufferedReader(new InputStreamReader(System.in));
    }

    public void start(String host,Integer port){
        ChannelFuture future = bootstrap.connect(host,port).syncUninterruptibly();
        channel = future.channel();
    }

    public static void main(String[] args) {
        NettyClientTest client = new NettyClientTest();
        client.start("127.0.0.1",8080);
    }

    class NettyClientHandler extends ChannelDuplexHandler{

        @Override
        public void channelActive(ChannelHandlerContext ctx) throws Exception {
            System.out.println("channel connect");
            String request = reader.readLine();
            ctx.writeAndFlush(Unpooled.copiedBuffer(request.getBytes()));
        }

        @Override
        public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
            if (msg instanceof ByteBuf){
                ByteBuf buf = (ByteBuf) msg;
                byte[] arr = new byte[buf.readableBytes()];
                buf.readBytes(arr);
                System.out.println("client recieve:"+new String(arr));
            }
            String request = reader.readLine();
            ctx.writeAndFlush(Unpooled.copiedBuffer(request.getBytes()));
        }
    }
}
