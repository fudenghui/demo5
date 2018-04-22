package com.fdh.controller;

import com.fdh.model.DeliverResume;
import com.fdh.model.Resume;
import com.fdh.model.Staff;
import com.fdh.model.User;
import com.fdh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.jws.WebParam;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/4/20 0020.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("goRegister")
    public String goRegister(){
        return "register";
    }
    @RequestMapping("register")
    public String register(User user, Model model){
        user.setLevel(1);
        boolean flag=userService.register(user);
        if (flag){
            return "../../index";
        }else {
            return "register";
        }
    }
    @RequestMapping("userLogin")
    public String userLogin(User user, HttpSession session){
        User user1=userService.userLogin(user);
        if (user1!=null){
            return "success";
        }else {
            return "../../index";
        }
    }
    @RequestMapping("staffLogin")
    public String staffLogin(Staff staff, HttpSession session){
        Staff staff1=userService.staffLogin(staff);
        if (staff1!=null){
            return "success";
        }else {
            return "../../index";
        }
    }
    //编译简历
    @RequestMapping("addResume")
    public String addResume(Resume resume){
        boolean flag=userService.addResume(resume);
        if (flag){
            return "";
        }
        return "";
    }
    //投递简历
    @RequestMapping("addDeliverResume")
    public String addDeliverResume(DeliverResume deliverResume){
        boolean flag=userService.addDeliverResume(deliverResume);
        if (flag){
            return "";
        }
        return "";
    }
}
