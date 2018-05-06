package com.fdh.dao;

import com.fdh.model.Interview;
import com.fdh.model.User;

import java.util.List;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
public interface InterviewMapper {
    //面试邀请
    boolean addInterview(Interview interview);
    //查看面试邀请
    List<Interview> seeInterview();
    //查看面试邀请根据用户
    List<Interview> seeInterviewByUser(int userId);
    //查看面试邀请根据用户当前页
    List<Interview> seeInterviewByUserCur(int userId,int firstRow,int lastRow);
    //查看面试邀请当前页
    List<Interview> seeInterviewCur(int firstRow,int lastRow);
    //查看面试邀请
    List<Interview> seeInterviewByUserId(int userId, int state);
    //查看面试邀请当前页
    List<Interview> seeInterviewByUserIdCur(int UserId,int state,int curentPage,int PAGESIZE);
    //确认面试
    boolean updateInterviewById(int interviewId,int state);
    //根据id查看面试邀请
    Interview getInterviewById(int id);
    //改变面试信息状态录用了状态改为1
    boolean updateInterview(Interview interview);
}
