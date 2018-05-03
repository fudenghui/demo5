package com.fdh.dao;

import com.fdh.model.Salary;
import com.fdh.model.Staff;

import java.util.List;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
public interface SalaryMapper {
    //查看薪资根据薪资月份
    List<Salary> getSalarys(String salaryDate);
    //添加薪资单
    boolean addSalary(Salary salary);
    //查询某员工的所有薪资单
    List<Salary> getSalaryByStaff(Staff staff);
}
