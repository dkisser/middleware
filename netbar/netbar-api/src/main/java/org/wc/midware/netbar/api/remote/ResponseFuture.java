package org.wc.midware.netbar.api.remote;

import java.util.Map;

/**
 * Created by WenChen on 2020/8/11.
 */
public interface ResponseFuture extends Future{

    void doReceived(Result result);

    default Result getTimeOutResult(){
        return new Result() {
            @Override
            public Throwable getException() {
                return new RuntimeException("client timeout");
            }

            @Override
            public Map getValue() {
                return null;
            }

            @Override
            public Boolean hasException() {
                return true;
            }
        };
    }

}
