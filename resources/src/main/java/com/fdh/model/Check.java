package com.fdh.model;

import java.util.Date;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
public class Check {
    private int id;
    private int staffId;
    private Date onWorkTime;
    private String onworkState;
    private Date outWorkTime;
    private String outworkTime;

    public Check() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public Date getOnWorkTime() {
        return onWorkTime;
    }

    public void setOnWorkTime(Date onWorkTime) {
        this.onWorkTime = onWorkTime;
    }

    public String getOnworkState() {
        return onworkState;
    }

    public void setOnworkState(String onworkState) {
        this.onworkState = onworkState;
    }

    public Date getOutWorkTime() {
        return outWorkTime;
    }

    public void setOutWorkTime(Date outWorkTime) {
        this.outWorkTime = outWorkTime;
    }

    public String getOutworkTime() {
        return outworkTime;
    }

    public void setOutworkTime(String outworkTime) {
        this.outworkTime = outworkTime;
    }
}
