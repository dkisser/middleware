package org.wc.prettydog.util.jdk.util.concurrent;

import org.junit.Test;

import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Set;
import java.util.TreeSet;

/**
 * Created by WenChen on 2020/6/22.
 */
public class TreeMapTest {

    @Test
    public void testTreeSet(){
        TreeSet<Integer> sets = new TreeSet<>();
        sets.add(1);
        sets.add(2);
        sets.add(3);
        NavigableSet s = sets.tailSet(2,false);
        System.out.println(s.first());
        System.out.println(s.pollFirst());
        System.out.println(s.first());//throw Exception
    }
}
