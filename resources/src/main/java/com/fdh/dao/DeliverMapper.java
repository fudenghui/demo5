package com.fdh.dao;

import com.fdh.model.DeliverResume;

import java.util.List;

/**
 * Created by Administrator on 2018/4/26 0026.
 */
public interface DeliverMapper {
    //获取投递信息
    List<DeliverResume> getDeliverResume();
    //获取投递信息当前页
    List<DeliverResume> getDeliverResumeCur(int firstRow,int lastRow);
    //根据id查看投递信息
    DeliverResume getDeliverById(int id);
}
