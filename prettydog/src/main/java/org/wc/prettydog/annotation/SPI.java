package org.wc.prettydog.annotation;

import java.lang.annotation.*;

/**
 * Created by WenChen on 2019/8/7.
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE})
public @interface SPI {

    String value() default "";

}
