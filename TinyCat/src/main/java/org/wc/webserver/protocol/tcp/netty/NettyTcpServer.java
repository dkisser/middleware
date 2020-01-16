package org.wc.webserver.protocol.tcp.netty;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.handler.codec.Delimiters;
import io.netty.handler.codec.LengthFieldBasedFrameDecoder;
import io.netty.handler.codec.bytes.ByteArrayEncoder;
import io.netty.util.concurrent.DefaultThreadFactory;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.prettydog.util.StringUtils;
import org.wc.webserver.conf.Constants;
import org.wc.webserver.protocol.tcp.AbstractTcpServer;
import org.wc.webserver.protocol.tcp.TcpHandler;
import org.wc.webserver.protocol.tcp.netty.decoder.CustomTcpDecoderDelegate;
import org.wc.webserver.support.ServerModule;

/**
 * Created by WenChen on 2020/1/2.
 */
public class NettyTcpServer extends AbstractTcpServer {

    private Logger logger = LoggerFactory.getLogger(NettyTcpServer.class);

    private ServerModule module;

    private EventLoopGroup bossGroup;

    private EventLoopGroup workerGroup;

    private ServerBootstrap serverBootstrap;

    private Channel channel;

    public NettyTcpServer(ServerModule module,TcpHandler handler) {
        super(handler);
        this.module = module;
        //bind server
        bossGroup = new NioEventLoopGroup(1,new DefaultThreadFactory("NettyServerBoss",true));
        workerGroup = new NioEventLoopGroup(Constants.DEFAULT_IO_THREADS,new DefaultThreadFactory
                ("NettyServerWorker",true));
        serverBootstrap = new ServerBootstrap();
        serverBootstrap.group(bossGroup,workerGroup)
            .channel(NioServerSocketChannel.class)
            .option(ChannelOption.SO_BACKLOG,128)
            .option(ChannelOption.SO_RCVBUF,4*1024)
//            .option(ChannelOption.SO_SNDBUF,4*1024)
            .childOption(ChannelOption.SO_KEEPALIVE,true)
            .childHandler(new ChannelInitializer<NioSocketChannel>() {
                @Override
                protected void initChannel(NioSocketChannel ch) throws Exception {
                ChannelPipeline pipeline = ch.pipeline();
                setDecoder(pipeline,module);
                pipeline.addLast("encoder",new ByteArrayEncoder())
                    //set msg resolver
                    .addLast("handler",new TcpChannelHandlerDelegate(handler));
                }
            });
        //start
        channel = serverBootstrap.bind(module.getPort())
                            .syncUninterruptibly().channel();
    }

    @Override
    public void close() {
        super.close();
        try{
            if (channel!=null){
                channel.close();
            }
        } catch (Throwable t){
            logger.error(t.getMessage(),t);
        }
        try{
            if (serverBootstrap!=null){
                bossGroup.shutdownGracefully();
                workerGroup.shutdownGracefully();
            }
        } catch (Throwable t){
            logger.error(t.getMessage(),t);
        }

    }

    private void setDecoder(ChannelPipeline pipeline,ServerModule module){
        String type = module.getAttribute("type","delimiter");
        if (!StringUtils.hasText(type)){
            pipeline.addLast("defaultDecoder",new DelimiterBasedFrameDecoder(Integer
                    .MAX_VALUE, Delimiters.lineDelimiter()[0]));
        }
        switch (type){
            case Constants.DELIMITER_DECODER_VALUE:
                pipeline.addLast("delimiterDecoder",new DelimiterBasedFrameDecoder(Integer.MAX_VALUE,Delimiters
                        .lineDelimiter()[0]));
                break;
            case Constants.LENGBASED_DECODER_VALUE:
                int maxFrameLength = Integer.parseInt(module.getAttribute(
                        Constants.TCP_MAXFRAMELENGTH_KEY,Constants.TCP_MAXFRAMELENGTH_VALUE));
                int lengthFieldOffset = Integer.parseInt(module.getAttribute(
                        Constants.TCP_LENGTHFIELDOFFSET_KEY,Constants.TCP_LENGTHFIELDOFFSET_VALUE));
                int lengthFieldLength = Integer.parseInt(module.getAttribute(
                        Constants.TCP_LENGTHFIELDLENGTH_KEY,Constants.TCP_LENGTHFIELDLENGTH_VALUE));
                int lengthAdjustment = Integer.parseInt(module.getAttribute(
                        Constants.TCP_LENGTHADJUSTMENT_KEY,Constants.TCP_LENGTHADJUSTMENT_VALUE));
                int initBytesToskip = Integer.parseInt(module.getAttribute(
                        Constants.TCP_INITBYTESTOSKIP_KEY,Constants.TCP_INITBYTESTOSKIP_VALUE));
                pipeline.addLast("lengBaseDecoder",new LengthFieldBasedFrameDecoder(
                        maxFrameLength,lengthFieldOffset,lengthFieldLength,lengthAdjustment,initBytesToskip));
                break;
            default:
                pipeline.addLast("customDecoder",new CustomTcpDecoderDelegate(module));
                break;
        }

    }
}
