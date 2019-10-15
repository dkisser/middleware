package org.wc.chameleon;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

/**
 * Created by WenChen on 2019/10/14.
 */
public class DynamicRouteDataSource extends AbstractRoutingDataSource {
    @Nullable
    protected Object determineCurrentLookupKey() {
        return DataSourceSelector.get();
    }
}
