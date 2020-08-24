package org.wc.midware.netbar.transporter;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.buffer.PooledByteBufAllocator;
import io.netty.channel.Channel;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.LengthFieldBasedFrameDecoder;
import io.netty.handler.codec.LengthFieldPrepender;
import org.wc.midware.netbar.api.Invoker;
import org.wc.midware.netbar.api.remote.Server;
import org.wc.midware.netbar.api.URL;

import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/8/10.
 */
public class NettyServer implements Server {

    //<ip:port,Channel>
    private static ConcurrentHashMap<String,Channel> channels = new ConcurrentHashMap<>(16);

    private URL url;

    private Channel channel;

    private Invoker invoker;

    private static final Integer WOKER_COUNT = 10;

    private static final Integer MAX_FRAME_LENGTH = 1024*1024*4;

    public NettyServer(URL url,Invoker invoker) {
        this.url = url;
        this.invoker = invoker;
    }

    @Override
    public void start() {
        if (!channels.containsKey(url.getIpAndPortStr())){
            buildServer();
        }
    }

    public void buildServer(){
        EventLoopGroup boss = new NioEventLoopGroup(1, r -> {return new Thread(r,"bossThread");});
        EventLoopGroup woker = new NioEventLoopGroup(WOKER_COUNT, r -> {return new Thread(r,"wokerThread");});
        ServerBootstrap bootstrap = new ServerBootstrap();
        bootstrap.group(boss,woker);
        NettyServerChannelHandler serverHandler = new NettyServerChannelHandler(invoker);
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
        Channel channel = bootstrap.bind(url.getIp(),url.getPort()).syncUninterruptibly().channel();
        this.channel = channel;
        channels.putIfAbsent(url.getIpAndPortStr(),channel);
    }

    @Override
    public void stop() {
        Optional<Channel> opt = Optional.ofNullable(channel);
        opt.filter(t->t.isActive()).orElseThrow(()->new RuntimeException("server has already stoped"));
        opt.get().close();
//        if (channel!=null){
//            if(channel.isActive()){
//                channel.close();
//            }
//        }
    }
}
