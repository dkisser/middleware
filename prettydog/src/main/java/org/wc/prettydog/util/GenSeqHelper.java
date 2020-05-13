package org.wc.prettydog.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.wc.prettydog.db.dao.CSequenceDetailMapper;
import org.wc.prettydog.db.dao.CSequenceMapper;
import org.wc.prettydog.db.pojo.CSequence;
import org.wc.prettydog.db.pojo.CSequenceDetail;

import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 分布式流水生成类
 * Created by WenChen on 2019/7/25.
 */
@Component
public class GenSeqHelper {

    private Object lock = new Object();

    @Autowired
    private CSequenceMapper cSequenceMapper;

    @Autowired
    private CSequenceDetailMapper cSequenceDetailMapper;

    //string为数据库seq_no字段
    private final ConcurrentHashMap<String,Seq> cache = new ConcurrentHashMap<>(5);
    /**
     * 1.构建缓存对象
     * 2.判断当前缓存对象是否已经到阈值
     * 3.去数据库取数据并加载，然后返回流水
     */
    private Seq initSeq (String seqNo){
        CSequence sequence = cSequenceMapper.selectOne(new CSequence(){{setSeqNo(seqNo);}});
        if (sequence == null){
            throw new IllegalArgumentException("输入的SEQ_NO不存在");
        }
        int cachSz = sequence.getCacheSz();
        int stepSz = sequence.getStepSz();
        Seq seq = null;
        //更新c_squence_detail中的记录
        CSequenceDetail detail = cSequenceDetailMapper.selectOne(new CSequenceDetail(){{setSeqNo(seqNo);}});
        int currentVal,allocated;
        if (detail == null){
            cSequenceDetailMapper.insertSelective(new CSequenceDetail(){{
                setSeqNo(seqNo);
                setAllocated(1);
                setCurrentVal(0);
            }});
            seq = new Seq(0,cachSz,stepSz);
        } else {
            allocated = detail.getAllocated()+1;
            seq = new Seq(cachSz*allocated,(allocated+1)*cachSz,stepSz);
            cSequenceDetailMapper.updateSelectiveBySeqNo(new CSequenceDetail(){{
                setSeqNo(seqNo);
                setAllocated(allocated);
                setUpdateTime(new Date());
            }});
        }
        cache.put(seqNo,seq);
        return seq;
    }

    public int getFlowCount (String seqNo){
        Seq seq = cache.getOrDefault(seqNo,null);
        //为空说明是第一次取
        if (seq == null){
            synchronized (lock){
                if (seq == null){
                    seq = initSeq(seqNo);
                }
            }
        }
        int result = seq.getNext();
        if (result == -1){
            synchronized (lock){
                result = seq.getNext();
                if (result == -1){
                    seq = initSeq(seqNo);
                    return seq.getNext();
                }
            }

        }
        return result;
    }

    public class Seq {
        private int minCount;
        private int maxCount;
        private int stepSz;

        public int getMinCount() {
            return minCount;
        }

        public int getMaxCount() {
            return maxCount;
        }

        public int getStepSz() {
            return stepSz;
        }

        public Seq (int currentCount, int maxCount, int stepSz){
            this.minCount = currentCount;
            this.maxCount = maxCount;
            this.stepSz = stepSz;
        }

        public synchronized int getNext (){
            int resultCode;
            int temp = minCount + stepSz;
            if (temp <= maxCount){
                resultCode = temp;
                minCount = temp;
            } else {
                //TODO 当temp>maxCount如何处理？
                /**
                 * 可将当前的seq的情况写入数据库对应的一张表，然后去下一段流水的时候将currentCount根据上次的未取得值来进行调整
                 */
                resultCode = -1;
            }
            return  resultCode;
        }
    }

}
