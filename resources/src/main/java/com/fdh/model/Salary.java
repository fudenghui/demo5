package com.fdh.model;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
public class Salary {
    private int id;
    private int staffId;
    private double baseSal;
    private double performance;//绩效
    private double ward;
    private double overTime;
    private double punish;
    private double emuem;//五险一金
    private double tax;
    private double allMoney;
    private String salaryDate;

    public Salary() {
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

    public double getBaseSal() {
        return baseSal;
    }

    public void setBaseSal(double baseSal) {
        this.baseSal = baseSal;
    }

    public double getPerformance() {
        return performance;
    }

    public void setPerformance(double performance) {
        this.performance = performance;
    }

    public double getWard() {
        return ward;
    }

    public void setWard(double ward) {
        this.ward = ward;
    }

    public double getPunish() {
        return punish;
    }

    public void setPunish(double punish) {
        this.punish = punish;
    }

    public double getEmuem() {
        return emuem;
    }

    public void setEmuem(double emuem) {
        this.emuem = emuem;
    }

    public double getTax() {
        return tax;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }

    public double getAllMoney() {
        return allMoney;
    }

    public void setAllMoney(double allMoney) {
        this.allMoney = allMoney;
    }

    public String getSalaryDate() {
        return salaryDate;
    }

    public void setSalaryDate(String salaryDate) {
        this.salaryDate = salaryDate;
    }

    public double getOverTime() {
        return overTime;
    }

    public void setOverTime(double overTime) {
        this.overTime = overTime;
    }

    @Override
    public String
    toString() {
        return "Salary{" +
                "id=" + id +
                ", staffId=" + staffId +
                ", baseSal=" + baseSal +
                ", performance=" + performance +
                ", ward=" + ward +
                ", overTime=" + overTime +
                ", punish=" + punish +
                ", emuem=" + emuem +
                ", tax=" + tax +
                ", allMoney=" + allMoney +
                ", salaryDate='" + salaryDate + '\'' +
                '}';
    }
}
