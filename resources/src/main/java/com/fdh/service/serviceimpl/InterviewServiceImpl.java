package com.fdh.service.serviceimpl;

import com.fdh.dao.InterviewMapper;
import com.fdh.model.Interview;
import com.fdh.model.User;
import com.fdh.service.InterviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
@Service
public class InterviewServiceImpl implements InterviewService {
    @Autowired
    private  InterviewMapper interviewMapper;

    //面试邀请
    @Override
    public boolean addInterview(Interview interview) {

        return interviewMapper.addInterview(interview);
    }
    //查看面试邀请
    @Override
    public List<Interview> seeInterview(int state) {
        return interviewMapper.seeInterview(state);
    }
    //查看面试邀请当前页
    @Override
    public List<Interview> seeInterviewCur(int state,int curentPage, int PAGESIZE) {
        int firstRow=(curentPage-1)*PAGESIZE+1;
        int lastRow=curentPage*PAGESIZE;
        return interviewMapper.seeInterviewCur(state,firstRow,lastRow);
    }
    //查看面试邀请
    @Override
    public List<Interview> seeInterview(User user,int state) {
        return interviewMapper.seeInterviewByUserId(user.getId(),state);
    }
    //查看面试邀请当前页
    @Override
    public List<Interview> seeInterviewCur(User user,int state,int curentPage, int PAGESIZE) {
        int firstRow=(curentPage-1)*PAGESIZE+1;
        int lastRow=curentPage*PAGESIZE;
        return interviewMapper.seeInterviewByUserIdCur(user.getId(),state,firstRow,lastRow);
    }
    //确认面试
    @Override
    public boolean updateInterviewById(int interviewId, int state) {
        return interviewMapper.updateInterviewById(interviewId,state);
    }
    //根据id查看面试邀请
    @Override
    public Interview getInterviewById(int id) {
        return interviewMapper.getInterviewById(id);
    }
}
