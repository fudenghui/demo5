package com.fdh.model;

/**
 * Created by Administrator on 2018/4/22 0022.
 */
public class Staff {
    private int id;
    private String staffName;
    private String staffPass;
    private int staffLevel;
    private String staffRealName;
    private String cardId;
    private String sex;
    private int age;
    private double salary;
    private int departId;
    private int positionId;
    private String hireTime;
    private String staffState;
    private String reson;
    private String outTime;

    public Staff() {
    }

    public Staff(int id, String staffName, String staffPass, int staffLevel, String staffRealName, String cardId, String sex, int age, double salary, int departId, int positionId, String hireTime, String staffState, String reson, String outTime) {
        this.id = id;
        this.staffName = staffName;
        this.staffPass = staffPass;
        this.staffLevel = staffLevel;
        this.staffRealName = staffRealName;
        this.cardId = cardId;
        this.sex = sex;
        this.age = age;
        this.salary = salary;
        this.departId = departId;
        this.positionId = positionId;
        this.hireTime = hireTime;
        this.staffState = staffState;
        this.reson = reson;
        this.outTime = outTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffPass() {
        return staffPass;
    }

    public void setStaffPass(String staffPass) {
        this.staffPass = staffPass;
    }

    public int getStaffLevel() {
        return staffLevel;
    }

    public void setStaffLevel(int staffLevel) {
        this.staffLevel = staffLevel;
    }

    public String getStaffRealName() {
        return staffRealName;
    }

    public void setStaffRealName(String staffRealName) {
        this.staffRealName = staffRealName;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
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

    public String getHireTime() {
        return hireTime;
    }

    public void setHireTime(String hireTime) {
        this.hireTime = hireTime;
    }

    public String getStaffState() {
        return staffState;
    }

    public void setStaffState(String staffState) {
        this.staffState = staffState;
    }

    public String getReson() {
        return reson;
    }

    public void setReson(String reson) {
        this.reson = reson;
    }

    public String getOutTime() {
        return outTime;
    }

    public void setOutTime(String outTime) {
        this.outTime = outTime;
    }
}
