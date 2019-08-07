package org.wc.prettydog.db.pojo;

import java.util.Date;

public class CSequenceDetail {
    private String seqNo;

    private Integer currentVal;

    private Integer allocated;

    private Date updateTime;

    private Date createTime;

    public String getSeqNo() {
        return seqNo;
    }

    public void setSeqNo(String seqNo) {
        this.seqNo = seqNo == null ? null : seqNo.trim();
    }

    public Integer getCurrentVal() {
        return currentVal;
    }

    public void setCurrentVal(Integer currentVal) {
        this.currentVal = currentVal;
    }

    public Integer getAllocated() {
        return allocated;
    }

    public void setAllocated(Integer allocated) {
        this.allocated = allocated;
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
}