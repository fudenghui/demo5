package com.fdh.service;

import com.fdh.model.DeliverResume;

import java.util.List;

/**
 * Created by Administrator on 2018/4/26 0026.
 */
public interface DeliverService {
    //获取投递信息
    List<DeliverResume> getDeliverResume();
    //获取投递信息当前页
    List<DeliverResume> getDeliverResumeCur(int curentPage,int PAGESIZE);
    //根据id查看投递信息
    DeliverResume getDeliverById(int id);
}
