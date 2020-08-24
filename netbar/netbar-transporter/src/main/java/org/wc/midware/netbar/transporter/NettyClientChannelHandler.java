package org.wc.midware.netbar.transporter;

import com.alibaba.fastjson.JSONObject;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.Channel;
import io.netty.channel.ChannelDuplexHandler;
import io.netty.channel.ChannelHandlerContext;
import org.wc.midware.netbar.api.Resolver;
import org.wc.midware.netbar.api.remote.Request;
import org.wc.midware.netbar.api.remote.Result;
import org.wc.midware.netbar.api.remote.ChannelHandler;
import org.wc.midware.netbar.api.remote.ResponseFuture;
import org.wc.midware.netbar.common.exception.RPCRuntimeException;
import org.wc.prettydog.support.ExtensionLoader;

import java.util.Map;

/**
 * Created by WenChen on 2020/8/11.
 */
@io.netty.channel.ChannelHandler.Sharable
public class NettyClientChannelHandler extends ChannelDuplexHandler implements ChannelHandler {

    private Resolver resolver = ExtensionLoader.getExtensionLoader(Resolver.class).getExtensionById("json");

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        if (msg instanceof ByteBuf){
            ByteBuf buf = (ByteBuf) msg;
            byte[] arr = new byte[buf.readableBytes()];
            buf.readBytes(arr);
            //TODO 发生异常后无法返回异常
            JSONObject response = JSONObject.parseObject(new String(arr));
            JSONObject header = response.getJSONObject("header");
            JSONObject body = response.getJSONObject("body");
            DefaultResponseFuture.recieved(new Result() {
                @Override
                public Throwable getException() {
                    return null;
                }

                @Override
                public Map getValue() {
                    return body;
                }

                @Override
                public Boolean hasException() {
                    return false;
                }
            },header.getLong("id"));
        } else if (msg instanceof Result){//暂时不支持
            Result t = (Result) msg;
            throw new RPCRuntimeException(t.getException());
        } else {
            throw new RPCRuntimeException("unknown result");
        }

    }

    public ByteBuf buildRequestByteBuf(Request request){
        Map data = resolver.pack(request);
        return Unpooled.copiedBuffer(JSONObject.toJSONBytes(data));
    }

    @Override
    public ResponseFuture handler(Request request,Channel channel) {
        ResponseFuture future = new DefaultResponseFuture(request);
        channel.writeAndFlush(buildRequestByteBuf(request));
        return future;
    }
}
