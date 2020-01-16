package org.wc.webserver.filter;

import org.wc.prettydog.util.LRUMap;

import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Created by WenChen on 2019/12/26.
 */
public abstract class AbstractFilter {

    private Set<Filter> chain = new LinkedHashSet<>();


}
