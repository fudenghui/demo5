package com.fdh.service.serviceimpl;

import com.fdh.dao.InterviewMapper;
import com.fdh.model.Interview;
import com.fdh.service.InterviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
