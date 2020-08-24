package org.wc.midware.netbar.common.exception;

import java.io.Serializable;

/**
 * Created by WenChen on 2020/8/18.
 */
public class RPCRuntimeException extends RuntimeException implements Serializable{

    private String code;

    private String msg;

    public RPCRuntimeException() {
        super();
    }

    public RPCRuntimeException(Throwable cause) {
        super(cause);
    }

    public RPCRuntimeException(String code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }

    public RPCRuntimeException(String msg) {
        super(msg);
        this.msg = msg;
        this.code = "9999";
    }
}
