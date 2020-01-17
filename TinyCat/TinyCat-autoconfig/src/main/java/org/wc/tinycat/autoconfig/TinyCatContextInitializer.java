package org.wc.tinycat.autoconfig;

import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;

/**
 * Created by WenChen on 2020/1/17.
 */
public class TinyCatContextInitializer implements ApplicationContextInitializer {

    @Override
    public void initialize(ConfigurableApplicationContext configurableApplicationContext) {
        configurableApplicationContext.addApplicationListener(new TinyCatApplicationListener());
    }
}
