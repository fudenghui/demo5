package com.fdh.service;

import com.fdh.model.DeliverResume;
import com.fdh.model.Resume;
import com.fdh.model.Staff;
import com.fdh.model.User;

/**
 * Created by Administrator on 2018/4/20 0020.
 */
public interface UserService {
    //注册
    boolean register(User user);
    //登录
    User userLogin(User user);
    //登录
    Staff staffLogin(Staff staff);
    //添加简历
    boolean addResume(Resume resume);
    //投递简历
    boolean addDeliverResume(DeliverResume deliverResume);
}
