package com.fdh.service;

import com.fdh.model.Staff;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
public interface StaffService {
    //修改员工信息
    boolean updateStaff(Staff staff);
    //查询员工
    Staff getStaffByName(Staff staff);
}
