package org.wc.prettydog.util;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.wc.prettydog.PrettydogApplication;
import org.wc.prettydog.db.dao.CSequenceMapper;
import org.wc.prettydog.db.pojo.CSequence;

import javax.swing.*;
import java.util.List;

/**
 * Created by WenChen on 2019/7/25.
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = {PrettydogApplication.class})
public class GenSeqTest {

    @Autowired
    private CSequenceMapper cSequenceMapper;

    @Autowired
    private GenSeqHelper seqHelper;

    @Test
    public void testDB (){
        CSequence sequence = cSequenceMapper.selectOne(new CSequence(){{setSeqNo("test");}});
        System.out.println(sequence);
        List<CSequence> sequenceList = cSequenceMapper.select(new CSequence(){{setSeqNo("test");}});
        System.out.println(sequenceList);
    }

    @Test
    public void testSeq (){
        for (int i=0;i<10;i++){
            System.out.println(seqHelper.getFlowCount("test"));
        }
        for (int i=0;i<10;i++){
            System.out.println(seqHelper.getFlowCount("test1"));
        }
    }
}
