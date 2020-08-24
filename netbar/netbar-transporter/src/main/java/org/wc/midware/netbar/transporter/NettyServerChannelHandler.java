package org.wc.midware.netbar.transporter;

import com.alibaba.fastjson.JSONObject;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelDuplexHandler;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import org.wc.midware.netbar.api.Invoker;
import org.wc.midware.netbar.api.Resolver;
import org.wc.midware.netbar.api.remote.Request;
import org.wc.midware.netbar.api.remote.Result;
import org.wc.midware.netbar.common.DefaultResult;
import org.wc.midware.netbar.common.exception.RPCRuntimeException;
import org.wc.prettydog.support.ExtensionLoader;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Created by WenChen on 2020/8/10.
 */
@ChannelHandler.Sharable
public class NettyServerChannelHandler extends ChannelDuplexHandler {

    private static final Logger logger = LoggerFactory.getLogger(NettyServerChannelHandler.class);

    private static ExecutorService excutor = new ThreadPoolExecutor(8,300,60000,
            TimeUnit.MILLISECONDS,new LinkedBlockingQueue());

    private Invoker invoker;

    private static AtomicLong reqId = new AtomicLong(0);

    private static Resolver resolver = ExtensionLoader.getExtensionLoader(Resolver.class).getExtensionById("json");

    public NettyServerChannelHandler(Invoker invoker) {
        this.invoker = invoker;
    }

    public Object buildResponseByteBuf(Result result, JSONObject request){
        JSONObject data = new JSONObject();
        data.put("header",request.getJSONObject("header"));
        if (result.hasException()){
            JSONObject body = new JSONObject();
            StackTraceElement[] e = result.getException().getStackTrace();
            body.put("exception",result.getException().toString());
            data.put("body",body);
        } else {
            data.put("body",result.getValue());
        }
        return Unpooled.copiedBuffer(data.toJSONString().getBytes());
    }

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        if (msg instanceof ByteBuf){
            ByteBuf buf = (ByteBuf) msg;
            byte[] arr = new byte[buf.readableBytes()];
            buf.readBytes(arr);
            JSONObject request = JSONObject.parseObject(new String(arr));
            Request req = resolver.unpack(request);
            Result result = invoker.invoke(req.getInvocation());
            ctx.writeAndFlush(buildResponseByteBuf(result,request));
        }
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        ctx.channel().close();
        logger.error(ctx.channel().remoteAddress()+":"+cause.getMessage());
        cause.printStackTrace();
    }

}
