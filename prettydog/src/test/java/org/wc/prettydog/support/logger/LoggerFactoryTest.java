package org.wc.prettydog.support.logger;

import org.junit.Test;

/**
 * Created by WenChen on 2019/12/16.
 */
public class LoggerFactoryTest {

    @Test
    public void testDefaultLogger(){
        Logger logger = LoggerFactory.getLogger(LoggerFactoryTest.class);
        logger.info("测试默认Logger");
    }

    @Test
    public void testLog4jLogger(){
        System.setProperty("prettydog.application.logger","log4j");
        Logger logger = LoggerFactory.getLogger(LoggerFactoryTest.class);
        logger.info("测试log4j");
        logger.info("测试:{}","aaa");
        logger.info("测试:{}","aaa","bbb");
        logger.info("测试:{},{}","aaa");
        logger.info("测试:{},000{}1","aaa","bbb");
        logger.warn("测试:{},000{}1","aaa","bbb");
        logger.debug("测试:{},000{}1","aaa","bbb");
        logger.trace("测试:{},000{}1","aaa","bbb");
        logger.error("测试:{},000{}1","aaa","bbb");
    }

    @Test
    public void testSlf4jLogger(){
        System.setProperty("prettydog.application.logger","slf4j");
        Logger logger = LoggerFactory.getLogger(LoggerFactoryTest.class);
        logger.info("测试slf4j");
        logger.info("测试:{}","aaa");
        logger.info("测试:{}","aaa","bbb");
        logger.info("测试:{},{}","aaa");
        logger.info("测试:{},000{}1","aaa","bbb");
        logger.warn("测试:{},000{}1","aaa","bbb");
        logger.debug("测试:{},000{}1","aaa","bbb");
        logger.trace("测试:{},000{}1","aaa","bbb");
        logger.error("测试:{},000{}1","aaa","bbb");
    }

    @Test
        public void testJclLogger(){
        System.setProperty("prettydog.application.logger","jcl");
        Logger logger = LoggerFactory.getLogger(LoggerFactoryTest.class);
        logger.info("测试jcl");
        logger.info("测试:{}","aaa");
        logger.info("测试:{}","aaa","bbb");
        logger.info("测试:{},{}","aaa");
        logger.info("测试:{},000{}1","aaa","bbb");
        logger.warn("测试:{},000{}1","aaa","bbb");
        logger.debug("测试:{},000{}1","aaa","bbb");
        logger.trace("测试:{},000{}1","aaa","bbb");
        logger.error("测试:{},000{}1","aaa","bbb");
    }

    @Test
    public void testJdkLogger(){
        System.setProperty("prettydog.application.logger","jdk");
        Logger logger = LoggerFactory.getLogger(LoggerFactoryTest.class);
        logger.info("测试jdk");
        logger.info("测试:{}","aaa");
        logger.info("测试:{}","aaa","bbb");
        logger.info("测试:{},{}","aaa");
        logger.info("测试:{},000{}1","aaa","bbb");
        logger.warn("测试:{},000{}1","aaa","bbb");
        logger.debug("测试:{},000{}1","aaa","bbb");
        logger.trace("测试:{},000{}1","aaa","bbb");
        logger.error("测试:{},000{}1","aaa","bbb");
    }
}
