package com.fdh.dao;

import com.fdh.model.Reconsider;
import com.fdh.model.Staff;

import java.util.List;

/**
 * Created by Administrator on 2018/5/3 0003.
 */
public interface ReconsiderMapper {
    //申请薪资复议
    boolean addReconsider(Reconsider reconsider);
    //查某员工的薪资复议记录
    List<Reconsider> getReconsiderByStaff(Staff staff);
    //查所有员工的复议记录
    List<Reconsider> getReconsiders();
    //更改复议状态
    boolean updateRecState(Reconsider reconsider);
}
