package org.wc.midware.netbar.transporter;

import io.netty.bootstrap.Bootstrap;
import io.netty.buffer.PooledByteBufAllocator;
import io.netty.channel.Channel;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.LengthFieldBasedFrameDecoder;
import io.netty.handler.codec.LengthFieldPrepender;
import org.wc.midware.netbar.api.Invocation;
import org.wc.midware.netbar.api.remote.Client;
import org.wc.midware.netbar.api.remote.Request;
import org.wc.midware.netbar.api.remote.Result;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.api.remote.ChannelHandler;
import org.wc.midware.netbar.common.remote.DefaultRequest;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by WenChen on 2020/8/10.
 */
public class NettyClient implements Client{

    private static final Integer MAX_FRAME_LENGTH = 1024*1024*4;

    private static final AtomicInteger client_index = new AtomicInteger(0);

    private static NettyClientChannelHandler channelHandler = new NettyClientChannelHandler();

    private URL url;

    private Channel[] cls;

    public NettyClient(URL url) {
        this.url = url;
        int connections = url.getIntArgumentOrDefault("connections",2);
        cls = new Channel[connections];
        for (int i=0;i<connections;i++){
            cls[i] = buildConnect(url);
        }
    }

    private Request buildRequest(Invocation invocation){
        DefaultRequest request = new DefaultRequest();
        request.setInvocation(invocation);
        return request;
    }

    public Channel getChannel(){
        if (cls.length == 1){
            return cls[0];
        } else {
            return cls[client_index.getAndIncrement() % cls.length];
        }
    }

    @Override
    public Result request(Invocation invocation) {
        //得到invoker,然后调用invoker.invoke
        Request request = buildRequest(invocation);
        int timeout = Integer.parseInt(url.getArgument("consumer.timeout","10000"));
        Result result = channelHandler.handler(request,getChannel()).get(timeout);
        return result;
    }

    @Override
    public boolean isAvaliable() {
        for (int i=0;i<cls.length;i++){
            if (cls[i].isActive()){
                return true;
            }
        }
        return false;
    }

    private static Channel buildConnect(URL url){
        EventLoopGroup boss = new NioEventLoopGroup(1,(r)->{return new Thread(r,"clientThread");});
        Bootstrap bootstrap = new Bootstrap();
        bootstrap.group(boss)
            .channel(NioSocketChannel.class)
            .option(ChannelOption.SO_KEEPALIVE,true)
            .option(ChannelOption.TCP_NODELAY, true)
            .option(ChannelOption.ALLOCATOR, PooledByteBufAllocator.DEFAULT)
            .handler(new ChannelInitializer<NioSocketChannel>() {
                @Override
                protected void initChannel(NioSocketChannel nioSocketChannel) throws Exception {
                    nioSocketChannel.pipeline()
                        .addLast("encoder",new LengthFieldPrepender(8))
                        .addLast("decoder",new LengthFieldBasedFrameDecoder(MAX_FRAME_LENGTH,0,8,0,8))
                        .addLast("handler",channelHandler);
                }
            });
        Channel channel = bootstrap.connect(url.getIp(),url.getPort()).syncUninterruptibly().channel();
        return channel;
    }

}
