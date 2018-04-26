package com.fdh.service.serviceimpl;

import com.fdh.dao.DeliverMapper;
import com.fdh.dao.StaffMapper;
import com.fdh.model.DeliverResume;
import com.fdh.model.Interview;
import com.fdh.model.Staff;
import com.fdh.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
@Service
public class StaffServiceImpl implements StaffService {
    @Autowired
    private StaffMapper staffMapper;
    @Autowired
    private DeliverMapper deliverMapper;
    //添加员工
    @Override
    public boolean addStaff(Interview interview, Staff staff) {
        DeliverResume deliverResume=deliverMapper.getDeliverById(interview.getDeliverResumeId());
        staff.setName(deliverResume.getPhone());
        String cardId=deliverResume.getCardId();
        String pass=cardId.substring(cardId.length()-6,cardId.length()-1);
        staff.setStaffPass(pass);
        staff.setLevel(2);
        staff.setCardId(cardId);
        staff.setSex(deliverResume.getSex());
        staff.setAge(deliverResume.getAge());
        staff.setDepartId(interview.getDepartId());
        staff.setPositionId(interview.getPositionId());
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String nowTime=sdf.format(date);
        staff.setHireTime(nowTime);
        staff.setStaffRealName(deliverResume.getUserName());
        return staffMapper.addStaff(staff);
    }

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
