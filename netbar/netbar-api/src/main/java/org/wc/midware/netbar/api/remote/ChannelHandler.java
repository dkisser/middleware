package org.wc.midware.netbar.api.remote;

import io.netty.channel.Channel;

/**
 * Created by WenChen on 2020/8/11.
 */
public interface ChannelHandler {

    ResponseFuture handler(Request request, Channel channel);
}
