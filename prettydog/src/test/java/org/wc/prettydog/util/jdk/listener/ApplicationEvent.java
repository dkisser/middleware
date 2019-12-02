package org.wc.prettydog.util.jdk.listener;

import java.util.EventObject;

/**
 * 事件源
 * Created by WenChen on 2019/12/2.
 */
public class ApplicationEvent extends EventObject {

    private static final String DEFAULT_NAME="applicationEvent";

    private String eventName;
    /**
     * Constructs a prototypical Event.
     *
     * @param source The object on which the Event initially occurred.
     * @throws IllegalArgumentException if source is null.
     */
    public ApplicationEvent(Object source) {
        this(source,DEFAULT_NAME);
    }

    public ApplicationEvent(Object source,String eventName) {
        super(source);
        this.eventName = eventName;
    }

    public String toString(){
        return String.format("eventName[%s],source[%s]",eventName,source);
    }
}