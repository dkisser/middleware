package org.wc.prettydog.mselect.exception;

/**
 * Created by WenChen on 2020/6/18.
 */
public class IllegalURLException extends IllegalArgumentException {

    public IllegalURLException() {
    }

    public IllegalURLException(String s) {
        super(s);
    }

    public IllegalURLException(String message, Throwable cause) {
        super(message, cause);
    }

    public IllegalURLException(Throwable cause) {
        super(cause);
    }
}
