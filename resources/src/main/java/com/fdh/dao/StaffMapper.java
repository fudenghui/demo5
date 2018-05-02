package com.fdh.dao;

import com.fdh.model.Staff;

import java.util.List;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
public interface StaffMapper {
    //修改员工信息
    boolean updateStaff(Staff staff);
    //查询员工
    Staff getStaffByName(Staff staff);
    //查询员工根据id
    Staff getStaffById(Staff staff);
    //添加员工
    boolean addStaff(Staff staff);
    //根据部门查询员工
    List<Staff> getStaffByDep(int departId);
    //查看所有员工
    List<Staff> getAllStaff();
    //根据职位查员工
    List<Staff> getStaffByPos(int positionId);
    //查询员工根据姓名
    Staff getStaffByRealName(String name);
    //查询所有在职员工
    List<Staff> getStaffs();
}
