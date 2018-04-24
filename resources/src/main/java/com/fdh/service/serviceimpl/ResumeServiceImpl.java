package com.fdh.service.serviceimpl;

import com.fdh.dao.ResumeMapper;
import com.fdh.model.DeliverResume;
import com.fdh.model.Resume;
import com.fdh.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
@Service
public class ResumeServiceImpl implements ResumeService{
    @Autowired
    private ResumeMapper resumeMapper;
    //添加简历
    @Override
    public boolean addResume(Resume resume){
        return resumeMapper.addResume(resume);
    }
    //投递简历
    @Override
    public boolean addDeliverResume(DeliverResume deliverResume){
        return resumeMapper.addDeliverResume(deliverResume);
    }
    //通过id查看简历
    @Override
    public Resume seeResumeById(int id) {
        Resume resume=new Resume();
        resume.setId(id);
        return resumeMapper.seeResumeById(resume);
    }
    //通过游客id查看简历
    @Override
    public List<Resume> seeResumeByUserId(int id) {
        return resumeMapper.seeResumeByUserId(id);
    }
    //修改简历

    @Override
    public boolean updateResume(Resume resume) {
        return resumeMapper.updateResume(resume);
    }
}
