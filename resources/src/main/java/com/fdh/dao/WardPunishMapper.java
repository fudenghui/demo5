package com.fdh.dao;

import com.fdh.model.Staff;
import com.fdh.model.WardPunish;

import java.util.List;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
public interface WardPunishMapper {
    //查询奖惩
    List<WardPunish> getAllWardPu();
    //添加奖励
    boolean addWardPunishForWard(WardPunish wardPunish);
    //添加惩罚
    boolean addWardPunishForPunish(WardPunish wardPunish);
    //添加惩罚
    boolean addWardPunish(WardPunish wardPunish);
    //修改惩罚金额
    boolean updateWardPunishForPu(WardPunish wardPunish);
    //根据时间查询惩罚记录
    List<WardPunish> getWardPunish(int staffId,String startTime,String endTime);
    //查询某员工的所有奖惩记录
    List<WardPunish> getWardPunishByStaff(Staff staff);
}
