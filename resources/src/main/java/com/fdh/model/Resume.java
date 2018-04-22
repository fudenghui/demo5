package com.fdh.model;

/**
 * Created by Administrator on 2018/4/22 0022.
 */
public class Resume {
    private int id;
    private String userName;
    private String sex;
    private int age;
    private String cardId;
    private String phone;
    private String email;
    private String state;
    private double expSal;
    private String edu;
    private String major;
    private String workOld;
    private String rate;

    public Resume() {
    }

    public Resume(int id, String userName, String sex, int age, String cardId, String phone, String email, String state, double expSal, String edu, String major, String workOld, String rate) {
        this.id = id;
        this.userName = userName;
        this.sex = sex;
        this.age = age;
        this.cardId = cardId;
        this.phone = phone;
        this.email = email;
        this.state = state;
        this.expSal = expSal;
        this.edu = edu;
        this.major = major;
        this.workOld = workOld;
        this.rate = rate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public double getExpSal() {
        return expSal;
    }

    public void setExpSal(double expSal) {
        this.expSal = expSal;
    }

    public String getEdu() {
        return edu;
    }

    public void setEdu(String edu) {
        this.edu = edu;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getWorkOld() {
        return workOld;
    }

    public void setWorkOld(String workOld) {
        this.workOld = workOld;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }
}
