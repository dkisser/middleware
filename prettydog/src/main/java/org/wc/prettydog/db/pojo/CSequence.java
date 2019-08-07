package org.wc.prettydog.db.pojo;

import java.util.Date;

public class CSequence {
    private String seqNo;

    private Integer stepSz;

    private String seqRule;

    private Integer maxVal;

    private Integer cacheSz;

    private Date updateTime;

    private Date createTime;

    public String getSeqNo() {
        return seqNo;
    }

    public void setSeqNo(String seqNo) {
        this.seqNo = seqNo == null ? null : seqNo.trim();
    }

    public Integer getStepSz() {
        return stepSz;
    }

    public void setStepSz(Integer stepSz) {
        this.stepSz = stepSz;
    }

    public String getSeqRule() {
        return seqRule;
    }

    public void setSeqRule(String seqRule) {
        this.seqRule = seqRule == null ? null : seqRule.trim();
    }

    public Integer getMaxVal() {
        return maxVal;
    }

    public void setMaxVal(Integer maxVal) {
        this.maxVal = maxVal;
    }

    public Integer getCacheSz() {
        return cacheSz;
    }

    public void setCacheSz(Integer cacheSz) {
        this.cacheSz = cacheSz;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "CSequence{" +
                "seqNo='" + seqNo + '\'' +
                ", stepSz=" + stepSz +
                ", seqRule='" + seqRule + '\'' +
                ", maxVal=" + maxVal +
                ", cacheSz=" + cacheSz +
                ", updateTime=" + updateTime +
                ", createTime=" + createTime +
                '}';
    }
}