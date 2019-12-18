package org.wc.prettydog.util.itest;

/**
 * Created by WenChen on 2019/12/11.
 */
public class ExtensionWrapper1 implements TestInterface{

    private TestInterface testInterface;

    public ExtensionWrapper1(TestInterface testInterface) {
        this.testInterface = testInterface;
    }

    @Override
    public void handler() {
        System.out.println("wrapper2 start");
        testInterface.handler();
        System.out.println("wrapper2 end");
    }
}
