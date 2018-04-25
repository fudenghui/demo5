package com.fdh.controller;

import com.fdh.model.*;
import com.fdh.service.DepartService;
import com.fdh.service.InterviewService;
import com.fdh.service.PositionService;
import com.fdh.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
@Controller
public class AdminController {
    @Autowired
    private RecruitService recruitService;
    @Autowired
    private InterviewService interviewService;
    @Autowired
    private PositionService positionService;
    @Autowired
    private DepartService departService;
    //管理员登录
    @RequestMapping("goAdmin")
    public String goAdmin(HttpSession session){
        /*Staff staff= (Staff) session.getAttribute("user");
        session.setAttribute("admin",staff);*/
        return "admin";
    }
    //发布招聘
    @RequestMapping("goAddRecruit")
    public String goAddRecruit(HttpSession session){
        List<Depart> departs=departService.seeDepart();
        session.setAttribute("departs",departs);
        return "addrecruit";
    }
    @RequestMapping("addRecruit")
    public String addRecruit(Recruit recruit, HttpSession session){
        boolean flag=recruitService.addRecRuit(recruit);
        if (flag){
            String curentPage="1";
            return adminSeeRecruits(curentPage,session);
        }
        return "addrecruit";
    }
    //根据部门名查职位
    @RequestMapping("getPositionsByDep")
    public @ResponseBody List<Position> getPositionsByDep(Depart depart, HttpSession session){
        List<Position> list=positionService.getPositionsByDep(depart);
        return list;
    }
    //查看招聘信息
    @RequestMapping("adminSeeRecruits")
    public String adminSeeRecruits(String curentPage,HttpSession session){
        List<Recruit> recruits=recruitService.seeRecruit();
        int totalRows=recruits.size();
        int curentPage1=Integer.parseInt(curentPage);
        int PAGESIZE=5;
        int allPages=totalRows%PAGESIZE==0?totalRows/PAGESIZE:totalRows/curentPage1+1;
        List<Recruit> recruitList=recruitService.seeRecruitCur(curentPage1,PAGESIZE);
        session.setAttribute("recruitList",recruitList);
        session.setAttribute("allPages",allPages);
        return "adminseerecruit";
    }
    //发出面试邀请
    @RequestMapping("addInterview")
    public String addInterview(Interview interview,String departName,String positionName,HttpSession session){
        Staff staff= (Staff) session.getAttribute("staff");
        interview.setStaffId(staff.getId());
        boolean flag=interviewService.addInterview(interview);
        if (flag){
            return "";
        }
        return "";
    }
    //查看面试邀请
    @RequestMapping("adminSeeInterview")
    public String adminSeeInterview(String curentPage,HttpSession session){
        List<Interview> interviews=interviewService.seeInterview(1);
        int totalRows=interviews.size();
        int curentPage1=Integer.parseInt(curentPage);
        int PAGESIZE=5;
        int allPages=totalRows%PAGESIZE==0?totalRows/PAGESIZE:totalRows/curentPage1+1;
        List<Interview> interviewList=interviewService.seeInterviewCur(1,curentPage1,PAGESIZE);
        session.setAttribute("interviewList",interviewList);
        session.setAttribute("allPages",allPages);
        return "adminseeinterview";
    }
    //查看部门
    @RequestMapping("seeDepart")
    public String seeDepart(HttpSession session){
        List<Depart> departs=departService.seeDepart();
        session.setAttribute("departs",departs);
        return "seedeppos";
    }
    //添加部门
    @RequestMapping("addDepart")
    public String addDepart(Depart depart,HttpSession session){
        departService.addDepart(depart);
        return seeDepart(session);
    }
    //添加职位
    @RequestMapping("addPosition")
    public String addPosition(Position position,String departName,HttpSession session){
        boolean flag=positionService.addPosition(position,departName);
        return "seedeppos";
    }
    //查看职位
    @RequestMapping("seePosition")
    public @ResponseBody List<Position> seePosition(String departName,HttpSession session){
        Depart depart=new Depart();
        depart.setDepartName(departName);
        List<Position> list=positionService.getPositionsByDep(depart);
        return list;
    }
}
