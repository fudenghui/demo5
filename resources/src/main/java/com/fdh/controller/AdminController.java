package com.fdh.controller;

import com.fdh.model.Interview;
import com.fdh.model.Recruit;
import com.fdh.model.Staff;
import com.fdh.service.InterviewService;
import com.fdh.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    //发布招聘
    @RequestMapping("addRecruit")
    public String addRecruit(Recruit recruit, HttpSession session){
        boolean flag=recruitService.addRecRuit(recruit);
        if (flag){
            String curentPage="1";
            return adminSeeRecruits(curentPage,session);
        }
        return "addrecruit";
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
}
