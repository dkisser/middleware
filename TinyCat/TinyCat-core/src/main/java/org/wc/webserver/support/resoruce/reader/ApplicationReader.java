package org.wc.webserver.support.resoruce.reader;

import org.wc.webserver.support.ServerModel;
import org.wc.webserver.support.resoruce.ResourceLoader;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by WenChen on 2020/1/19.
 */
public class ApplicationReader extends AbstractReader {

    private static List<ServerModel> models = new ArrayList<>();

    public static void addModel(ServerModel model){
        models.add(model);
    }

    public ApplicationReader() {
        super(null);
    }

    @Override
    public List<ServerModel> parse() {
        return models;
    }
}
