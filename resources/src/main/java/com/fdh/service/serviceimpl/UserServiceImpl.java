package com.fdh.service.serviceimpl;

import com.fdh.dao.UserMapper;
import com.fdh.model.DeliverResume;
import com.fdh.model.Resume;
import com.fdh.model.Staff;
import com.fdh.model.User;
import com.fdh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/4/20 0020.
 */
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;
    //注册
    @Override
    public boolean register(User user) {
        return userMapper.register(user);
    }
    //登录
    @Override
    public User userLogin(User user){
       User user1=userMapper.userLogin(user);
       if (user1!=null){
           if (user1.getName().equals(user.getName())&&user1.getPass().equals(user.getPass())){
               return user1;
           }
           return null;
       }
       return null;
    }
    //登录
    @Override
    public Staff staffLogin(Staff staff){
        Staff staff1=userMapper.staffLogin(staff);
        if (staff1!=null){
            if (staff1.getName().equals(staff.getName())&&staff1.getStaffPass().equals(staff.getStaffPass())){
                return staff1;
            }
            return null;
        }
        return null;
    }
    //修改密码
    @Override
    public boolean updateUser(User user){
        return userMapper.updateUser(user);
    }
    //根据账户查用户
    @Override
    public User getUser(User user) {
        return userMapper.userLogin(user);
    }
}
