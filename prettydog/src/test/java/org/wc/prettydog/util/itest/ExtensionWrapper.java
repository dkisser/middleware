package org.wc.prettydog.util.itest;

/**
 * Created by WenChen on 2019/12/11.
 */
public class ExtensionWrapper implements TestInterface{

    private TestInterface testInterface;

    public ExtensionWrapper(TestInterface testInterface) {
        this.testInterface = testInterface;
    }

    @Override
    public void handler() {
        System.out.println("wrapper1 start");
        testInterface.handler();
        System.out.println("wrapper1 end");
    }
}
