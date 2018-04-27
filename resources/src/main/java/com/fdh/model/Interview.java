package com.fdh.model;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
public class Interview {
    private int id;
    private int adminId;
    private int userId;
    private int departId;
    private int positionId;
    private String interviewTime;
    private String location;
    private String phone;
    private int deliverResumeId;
    private int interviewState;
    private Depart depart;
    private Position position;

    public Interview() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public int getDepartId() {
        return departId;
    }

    public void setDepartId(int departId) {
        this.departId = departId;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public String getInterviewTime() {
        return interviewTime;
    }

    public void setInterviewTime(String interviewTime) {
        this.interviewTime = interviewTime;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getDeliverResumeId() {
        return deliverResumeId;
    }

    public void setDeliverResumeId(int deliverResumeId) {
        this.deliverResumeId = deliverResumeId;
    }

    public int getInterviewState() {
        return interviewState;
    }

    public void setInterviewState(int interviewState) {
        this.interviewState = interviewState;
    }

    public Depart getDepart() {
        return depart;
    }

    public void setDepart(Depart depart) {
        this.depart = depart;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Interview{" +
                "id=" + id +
                ", adminId=" + adminId +
                ", userId=" + userId +
                ", departId=" + departId +
                ", positionId=" + positionId +
                ", interviewTime='" + interviewTime + '\'' +
                ", location='" + location + '\'' +
                ", phone='" + phone + '\'' +
                ", deliverResumeId=" + deliverResumeId +
                ", interviewState=" + interviewState +
                '}';
    }
}
