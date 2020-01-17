package org.wc.webserver.support;

import java.util.Map;

/**
 * Created by WenChen on 2020/1/16.
 */
public class RequestResponseModel {

    private String Uri;

    private Map<String,String> requestHead;

    private byte[] requestBody;

    private Map<String,String> responseHead;

    private byte[] responseBody;

    public String getUri() {
        return Uri;
    }

    public RequestResponseModel setUri(String uri) {
        Uri = uri;
        return this;
    }

    public Map<String, String> getRequestHead() {
        return requestHead;
    }

    public RequestResponseModel setRequestHead(Map<String, String> requestHead) {
        this.requestHead = requestHead;
        return this;
    }

    public byte[] getRequestBody() {
        return requestBody;
    }

    public RequestResponseModel setRequestBody(byte[] requestBody) {
        this.requestBody = requestBody;
        return this;
    }

    public Map<String, String> getResponseHead() {
        return responseHead;
    }

    public RequestResponseModel setResponseHead(Map<String, String> responseHead) {
        this.responseHead = responseHead;
        return this;
    }

    public byte[] getResponseBody() {
        return responseBody;
    }

    public RequestResponseModel setResponseBody(byte[] responseBody) {
        this.responseBody = responseBody;
        return this;
    }
}
