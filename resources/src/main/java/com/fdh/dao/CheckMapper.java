package com.fdh.dao;

import com.fdh.model.Check;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
public interface CheckMapper {
    //查询考勤
    Check seeCheck(int staffId,String startDate,String lastDate);
}
