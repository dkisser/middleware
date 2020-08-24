package org.wc.midware.netbar.common.config;

import org.wc.midware.netbar.api.URL;
import org.wc.prettydog.annotation.SPI;

import java.util.List;

/**
 * Created by WenChen on 2020/8/12.
 */
@SPI("yaml")
public interface Parser {

    List<URL> parse();

}
