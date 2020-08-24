package org.wc.midware.netbar.common.remote;

import org.wc.midware.netbar.api.remote.Result;

import java.util.Map;

/**
 * Created by WenChen on 2020/8/11.
 */
public class Response {
    //服务端接受请求报文header中的id后在相应response头中要传过来
    private Long id;

    private Result result;

    public Response (Long id){
        this.id = id;
    }

    public Response(Long id, Result result) {
        this.id = id;
        this.result = result;
    }

    public Long getId() {
        return id;
    }

    public Response setId(Long id) {
        this.id = id;
        return this;
    }

    public Result getResult() {
        return result;
    }

    public Response setResult(Result result) {
        this.result = result;
        return this;
    }
}
