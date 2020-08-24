package org.wc.midware.netbar.common;

import org.wc.midware.netbar.api.remote.Result;

import java.io.Serializable;
import java.util.Map;

/**
 * Created by WenChen on 2020/8/13.
 */
public class DefaultResult implements Result,Serializable{

    private Throwable t;

    private Map vallue;

    private Boolean hasException;

    public DefaultResult(Throwable t, Map vallue, Boolean hasException) {
        this.t = t;
        this.vallue = vallue;
        this.hasException = hasException;
    }

    public DefaultResult(Result result) {
        this.t = result.getException();
        this.vallue = result.getValue();
        this.hasException = result.hasException();
    }

    @Override
    public Throwable getException() {
        return t;
    }

    @Override
    public Map getValue() {
        return vallue;
    }

    @Override
    public Boolean hasException() {
        return hasException;
    }
}
