package com.fdh.controller;

import com.fdh.model.*;
import com.fdh.service.InterviewService;
import com.fdh.service.RecruitService;
import com.fdh.service.ResumeService;
import com.fdh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @Autowired
    private InterviewService interviewService;
    //跳到登录页面
    @RequestMapping("goLogin")
    public String goLogin(){
        return "login";
    }
    //跳转到注册页
    @RequestMapping("goRegister")
    public String goRegister(){
        return "register";
    }
    //注册
    @RequestMapping("register")
    public String register(User user, Model model){
        user.setLevel(3);
        boolean flag=userService.register(user);
        if (flag){
            return "../../index";
        }else {
            return "register";
        }
    }
    //登录
    @RequestMapping("login")
    public String userLogin(String name, String pass, String cl, HttpSession session){
        if (cl.equals("游客")){
            User user=new User();
            user.setName(name);
            user.setPass(pass);
            User user1=userService.userLogin(user);
            if (user1!=null){
                List<Resume> resumes=resumeService.seeResumeByUserId(user1.getId());
                session.setAttribute("resumes",resumes);
                session.setAttribute("user",user1);
                return "../../index";
            }else {
                return null;
            }
        }else {
            Staff staff=new Staff();
            staff.setName(name);
            staff.setStaffPass(pass);
            Staff staff1=userService.staffLogin(staff);
            if (staff1!=null){
                session.setAttribute("user",staff1);
                return "../../index";
            }else {
                return null;
            }
        }
    }
    @RequestMapping("getResumes")
    public @ResponseBody List<Resume> getResumes(String userId,HttpSession session){
        int userId1=Integer.parseInt(userId);
        List<Resume> list=resumeService.seeResumeByUserId(userId1);
        return list;
    }
    //跳转到首页
    @RequestMapping("goFirst")
    public  String goFirst(){
        return "../../index";
    }
    //游客账户信息
    @RequestMapping("goUserInfo")
    public String goUserInfo(HttpSession session){
        User user= (User) session.getAttribute("user");
        session.setAttribute("user",user);
        return "userinfo";
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
    public String addResume(Resume resume,HttpSession session){
        User user= (User) session.getAttribute("user");
        boolean flag=resumeService.addResume(user,resume);
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
    //查看面试邀请
    @RequestMapping("seeInterview")
    public String seeInterview(String curentPage,HttpSession session){
        List<Interview> interviews=interviewService.seeInterview(1);
        int totalRows=interviews.size();
        int curentPage1=Integer.parseInt(curentPage);
        int PAGESIZE=5;
        int allPages=totalRows%PAGESIZE==0?totalRows/PAGESIZE:totalRows/curentPage1+1;
        List<Interview> interviewList=interviewService.seeInterviewCur(1,curentPage1,PAGESIZE);
        session.setAttribute("interviewList",interviewList);
        session.setAttribute("allPages",allPages);
        return "seeinterview";
    }
    //确认面试
    @RequestMapping("updateInterviewById")
    public String updateInterviewById(String interviewId,HttpSession session){
        int state=2;
        int interviewId1=Integer.parseInt(interviewId);
        boolean flag=interviewService.updateInterviewById(interviewId1,state);
        if (flag){
            String curentPage="1";
            return seeInterview(curentPage,session);
        }
        String curentPage="1";
        return seeInterview(curentPage,session);
    }
    //查看简历信息
    @RequestMapping("seeResume")
    public String seeResume(HttpSession session){
        User user= (User) session.getAttribute("user");
        List<Resume> resumes=resumeService.seeResumeByUserId(user.getId());
        session.setAttribute("resumes",resumes);
        return "resume";
    }
    //查看简历详情
    @RequestMapping("seeResumeInfo")
    public String seeResumeInfo(Resume resume,HttpSession session){
        Resume resume1=resumeService.seeResumeById(resume.getId());
        session.setAttribute("resumeInfo",resume1);
        return "resumeinfo";
    }
    //修改简历
    @RequestMapping("updateResume")
    public String updateResume(Resume resume,HttpSession session){
        boolean flag=resumeService.updateResume(resume);
        if (flag){
            return seeResume(session);
        }else {
            return seeResumeInfo(resume,session);
        }
    }
}
