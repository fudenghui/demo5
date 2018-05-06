package com.fdh.service;

import com.fdh.model.Interview;
import com.fdh.model.User;

import java.util.List;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
public interface InterviewService {
    //面试邀请
    boolean addInterview(Interview interview);
    //查看面试邀请
    List<Interview> seeInterview();
    //根据用户查看面试
    List<Interview> seeInterviewByUser(User user);
    //查看面试邀请当前页
    List<Interview> seeInterviewCur(int curentPage,int PAGESIZE);
    //查看面试邀请当前页根据用户
    List<Interview> seeInterviewByUserCur(User user,int curentPage,int PAGESIZE);
    //查看面试邀请
    List<Interview> seeInterview(User user, int state);
    //查看面试邀请当前页
    List<Interview> seeInterviewCur(User user,int state,int curentPage,int PAGESIZE);
    //确认面试
    boolean updateInterviewById(int interviewId,int state);
    //根据id查看面试邀请
    Interview getInterviewById(int id);
    //改变面试信息状态录用了状态改为1
    boolean updateInterview(Interview interview);
}
