package com.fdh.service;

import com.fdh.model.Check;

import java.util.List;

/**
 * Created by Administrator on 2018/4/30 0030.
 */
public interface CheckService {
    //添加打卡记录
    boolean addCheck(Check check);
    //查看考勤
    List<Check> getChecks(int staffId);
}
