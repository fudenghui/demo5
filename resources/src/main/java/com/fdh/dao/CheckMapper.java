package com.fdh.dao;

import com.fdh.model.Check;

import java.util.List;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
public interface CheckMapper {
    //查询考勤
    List<Check> seeCheck(int staffId, String startDate, String lastDate);
    //添加考勤记录
    boolean addCheckForAm(Check check);
    boolean updateCheckForPm(Check check);
    //查询记录
    Check getCheckByStaff(int staffId,String startTime,String endTime);
}
