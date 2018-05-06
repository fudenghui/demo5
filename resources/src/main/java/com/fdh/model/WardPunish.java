package com.fdh.model;

import java.util.Date;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
public class WardPunish {
    private int id;
    private int staffId;
    private double ward;
    private String wardDes;
    private double punish;
    private String punishDes;
    private String wardPunishTime;
    private Staff staff;

    public WardPunish() {
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

    public double getWard() {
        return ward;
    }

    public void setWard(double ward) {
        this.ward = ward;
    }

    public String getWardDes() {
        return wardDes;
    }

    public void setWardDes(String wardDes) {
        this.wardDes = wardDes;
    }

    public double getPunish() {
        return punish;
    }

    public void setPunish(double punish) {
        this.punish = punish;
    }

    public String getPunishDes() {
        return punishDes;
    }

    public void setPunishDes(String punishDes) {
        this.punishDes = punishDes;
    }

    public String getWardPunishTime() {
        return wardPunishTime;
    }

    public void setWardPunishTime(String wardPunishTime) {
        this.wardPunishTime = wardPunishTime;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    @Override
    public String toString() {
        return "WardPunish{" +
                "id=" + id +
                ", staffId=" + staffId +
                ", ward=" + ward +
                ", wardDes='" + wardDes + '\'' +
                ", punish=" + punish +
                ", punishDes='" + punishDes + '\'' +
                ", wardPunishTime='" + wardPunishTime + '\'' +
                ", staff=" + staff +
                '}';
    }
}
