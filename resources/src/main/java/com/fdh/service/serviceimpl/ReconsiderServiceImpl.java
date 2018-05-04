package com.fdh.service.serviceimpl;

import com.fdh.dao.ReconsiderMapper;
import com.fdh.model.Reconsider;
import com.fdh.model.Staff;
import com.fdh.service.ReconsiderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/5/3 0003.
 */
@Service
public class ReconsiderServiceImpl implements ReconsiderService {
    @Autowired
    private ReconsiderMapper reconsiderMapper;
    //申请薪资复议
    @Override
    public boolean addReconsider(Reconsider reconsider) {
        return reconsiderMapper.addReconsider(reconsider);
    }
    //查某员工的薪资复议记录
    @Override
    public List<Reconsider> getReconsiderByStaff(Staff staff) {
        return reconsiderMapper.getReconsiderByStaff(staff);
    }
    //查所有员工的复议记录
    @Override
    public List<Reconsider> getReconsiders() {
        return reconsiderMapper.getReconsiders();
    }
    //更改复议状态
    @Override
    public boolean updateRecState(Reconsider reconsider) {
        return reconsiderMapper.updateRecState(reconsider);
    }
}
