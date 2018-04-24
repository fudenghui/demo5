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
    List<Interview> seeInterview(int state);
    //查看面试邀请当前页
    List<Interview> seeInterviewCur(int state,int firstRow,int lastRow);
    //查看面试邀请
    List<Interview> seeInterviewByUserId(int userId, int state);
    //查看面试邀请当前页
    List<Interview> seeInterviewByUserIdCur(int UserId,int state,int curentPage,int PAGESIZE);
    //确认面试
    boolean updateInterviewById(int interviewId,int state);
}
