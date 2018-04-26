package com.fdh.service;

import com.fdh.model.Recruit;

import java.util.List;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
public interface RecruitService {
    //查看招聘信息
    List<Recruit> seeRecruit();
    //查看招聘信息当前页
    List<Recruit> seeRecruitCur(int curentPage,int PAGESIZE);
    //查看招聘信息
    List<Recruit> seeRecruitByState();
    //查看招聘信息当前页
    List<Recruit> seeRecruitCurByState(int curentPage,int PAGESIZE);
    //通过id查看招聘信息
    Recruit seeRecruitById(int id);
    //添加招聘信息
    boolean addRecRuit(String departName,String positionName,Recruit recruit);
    //发布
    boolean updateRecruitState(int recruitId);
}
