package com.fdh.service;

import com.fdh.model.DeliverResume;
import com.fdh.model.Resume;

import java.util.List;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
public interface ResumeService {
    //添加简历
    boolean addResume(Resume resume);
    //投递简历
    boolean addDeliverResume(DeliverResume deliverResume);
    //通过id查看简历
    Resume seeResumeById(int id);
    //通过用户id查看简历
    List<Resume> seeResumeByUserId(int id);
    //修改简历
    boolean updateResume(Resume resume);

}
