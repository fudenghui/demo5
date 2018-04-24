package com.fdh.model;

import java.util.Date;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
public class Train {
    private int id;
    private int departId;
    private int target;
    private Date trainStartTime;
    private Date trainEndTime;
    private String location;
    private String content;
    private int state;
    private int staffId;

    public Train() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDepartId() {
        return departId;
    }

    public void setDepartId(int departId) {
        this.departId = departId;
    }

    public int getTarget() {
        return target;
    }

    public void setTarget(int target) {
        this.target = target;
    }

    public Date getTrainStartTime() {
        return trainStartTime;
    }

    public void setTrainStartTime(Date trainStartTime) {
        this.trainStartTime = trainStartTime;
    }

    public Date getTrainEndTime() {
        return trainEndTime;
    }

    public void setTrainEndTime(Date trainEndTime) {
        this.trainEndTime = trainEndTime;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }
}
