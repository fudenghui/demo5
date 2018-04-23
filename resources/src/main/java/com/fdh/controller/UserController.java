package com.fdh.controller;

import com.fdh.model.*;
import com.fdh.service.RecruitService;
import com.fdh.service.ResumeService;
import com.fdh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/4/20 0020.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ResumeService resumeService;
    @Autowired
    private RecruitService recruitService;
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
    @RequestMapping("login")
    public String userLogin(String name,String pass,String cl, HttpSession session){
        if (cl.equals("游客")){
            User user=new User();
            user.setName(name);
            user.setPass(pass);
            User user1=userService.userLogin(user);
            if (user1!=null){
                session.setAttribute("user",user1);
                return "success";
            }else {
                return "../../index";
            }
        }else {
            Staff staff=new Staff();
            staff.setStaffName(name);
            staff.setStaffPass(pass);
            Staff staff1=userService.staffLogin(staff);
            if (staff1!=null){
                session.setAttribute("staff",staff1);
                return "success";
            }else {
                return "../../index";
            }
        }
    }
    //修改密码
    @RequestMapping("updateUser")
    public String updateUser(String passOld,String passNew,String passNew1,HttpSession session){
        if (passOld.equals("")){
            return "userinfo";
        }else {
            if ((!passNew.equals(""))&&passNew.equals(passNew1)){
                User user1= (User) session.getAttribute("user");
                user1.setPass(passNew);
                boolean flag=userService.updateUser(user1);
                if (flag){
                    session.setAttribute("user",user1);
                    return "userinfo";
                }
                return "userinfo";
            }
            return "userinfo";
        }
    }
    //跳转简历编辑页
    @RequestMapping("goAddResume")
    public String goAddResume(){
        return "addresume";
    }
    //编辑简历
    @RequestMapping("addResume")
    public String addResume(Resume resume){
        boolean flag=resumeService.addResume(resume);
        if (flag){
            return "userinfo";
        }
        return "addresume";
    }
    //投递简历
    @RequestMapping("addDeliverResume")
    public String addDeliverResume(String resumeId,String recruitId,HttpSession session){
        int resumeId1=Integer.parseInt(resumeId);
        int recruitId1=Integer.parseInt(recruitId);
        Resume resume=resumeService.seeResumeById(resumeId1);
        Recruit recruit=recruitService.seeRecruitById(recruitId1);
        DeliverResume deliverResume=new DeliverResume();
        User user1= (User) session.getAttribute("user");
        deliverResume.setUserId(user1.getId());
        deliverResume.setUserName(resume.getUserName());
        deliverResume.setSex(resume.getSex());
        deliverResume.setAge(resume.getAge());
        deliverResume.setCardId(resume.getCardId());
        deliverResume.setPhone(resume.getPhone());
        deliverResume.setEmail(resume.getEmail());
        deliverResume.setState(resume.getState());
        deliverResume.setExpSal(resume.getExpSal());
        deliverResume.setEdu(resume.getEdu());
        deliverResume.setSchool(resume.getSchool());
        deliverResume.setMajor(resume.getMajor());
        deliverResume.setWorkOld(resume.getWorkOld());
        deliverResume.setRate(resume.getRate());
        deliverResume.setRecruitId(recruit.getId());
        boolean flag=resumeService.addDeliverResume(deliverResume);
        if (flag){
            return "recruit";
        }
        return "recruit";
    }
    //查看招聘信息
    @RequestMapping("seeRecruits")
    public String seeRecruits(String curentPage,HttpSession session){
        List<Recruit> recruits=recruitService.seeRecruit();
        int totalRows=recruits.size();
        int curentPage1=Integer.parseInt(curentPage);
        int PAGESIZE=5;
        int allPages=totalRows%PAGESIZE==0?totalRows/PAGESIZE:totalRows/curentPage1+1;
        List<Recruit> recruitList=recruitService.seeRecruitCur(curentPage1,PAGESIZE);
        session.setAttribute("recruitList",recruitList);
        session.setAttribute("allPages",allPages);
        return "recruit";
    }
}
