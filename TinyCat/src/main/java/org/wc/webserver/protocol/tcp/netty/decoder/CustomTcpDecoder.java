package org.wc.webserver.protocol.tcp.netty.decoder;

import io.netty.buffer.ByteBuf;
import org.wc.prettydog.annotation.SPI;

/**
 * Created by WenChen on 2020/1/9.
 */
@SPI
public interface CustomTcpDecoder {

    Object decode(ByteBuf buf);

}
