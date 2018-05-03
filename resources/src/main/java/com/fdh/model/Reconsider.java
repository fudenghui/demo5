package com.fdh.model;

/**
 * Created by Administrator on 2018/5/3 0003.
 */
public class Reconsider {
    private int id;
    private int staffId;
    private String recDate;
    private double recMoney;
    private String recContent;
    private int recState;
    private String recTime;

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

    public String getRecDate() {
        return recDate;
    }

    public void setRecDate(String recDate) {
        this.recDate = recDate;
    }

    public double getRecMoney() {
        return recMoney;
    }

    public void setRecMoney(double recMoney) {
        this.recMoney = recMoney;
    }

    public String getRecContent() {
        return recContent;
    }

    public void setRecContent(String recContent) {
        this.recContent = recContent;
    }

    public int getRecState() {
        return recState;
    }

    public void setRecState(int recState) {
        this.recState = recState;
    }

    public String getRecTime() {
        return recTime;
    }

    public void setRecTime(String recTime) {
        this.recTime = recTime;
    }

    @Override
    public String toString() {
        return "Reconsider{" +
                "id=" + id +
                ", staffId=" + staffId +
                ", recDate='" + recDate + '\'' +
                ", recMoney=" + recMoney +
                ", recContent='" + recContent + '\'' +
                ", recState=" + recState +
                ", recTime='" + recTime + '\'' +
                '}';
    }
}
