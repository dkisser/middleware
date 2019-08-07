package org.wc.webserver.conf;

/**
 * Created by WenChen on 2019/5/20.
 */
public enum ErrorContent {

    ERROR_404(404,"uri not found.");

    private int errorCode;

    private String errorMsg;

    ErrorContent(int errorCode, String errorMsg) {
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public String getErrorMsg() {
        return errorMsg;
    }
}