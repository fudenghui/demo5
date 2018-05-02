package com.fdh.service;

import com.fdh.model.Salary;

import java.util.List;

/**
 * Created by Administrator on 2018/5/2 0002.
 */
public interface SalaryService {
    //查看薪资根据薪资月份
    List<Salary> getSalarys(String salaryDate);
    //添加薪资单
    boolean addSalary(Salary salary);
}
