package com.fdh.service.serviceimpl;

import com.fdh.dao.StaffMapper;
import com.fdh.model.Staff;
import com.fdh.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
@Service
public class StaffServiceImpl implements StaffService {
    @Autowired
    private StaffMapper staffMapper;
    //修改员工信息
    @Override
    public boolean updateStaff(Staff staff) {
        return staffMapper.updateStaff(staff);
    }
    //查询员工
    @Override
    public Staff getStaffByName(Staff staff) {
        return staffMapper.getStaffByName(staff);
    }
}
