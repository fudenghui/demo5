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
    public List<Interview> seeInterview() {
        return interviewMapper.seeInterview();
    }
    //根据用户查看面试
    @Override
    public List<Interview> seeInterviewByUser(User user) {
        return interviewMapper.seeInterviewByUser(user.getId());
    }

    //查看面试邀请当前页
    @Override
    public List<Interview> seeInterviewCur(int curentPage, int PAGESIZE) {
        int firstRow=(curentPage-1)*PAGESIZE+1;
        int lastRow=curentPage*PAGESIZE;
        return interviewMapper.seeInterviewCur(firstRow,lastRow);
    }
    //查看面试邀请当前页根据用户
    @Override
    public List<Interview> seeInterviewByUserCur(User user, int curentPage, int PAGESIZE) {
        int firstRow=(curentPage-1)*PAGESIZE+1;
        int lastRow=curentPage*PAGESIZE;
        return interviewMapper.seeInterviewByUserCur(user.getId(),firstRow,lastRow);
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
    //改变面试信息状态录用了状态改为1
    @Override
    public boolean updateInterview(Interview interview) {
        interview.setInterviewState(1);
        return interviewMapper.updateInterview(interview);
    }
}
