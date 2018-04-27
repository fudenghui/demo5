package com.fdh.controller;

import com.fdh.model.*;
import com.fdh.service.*;
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
    @Autowired
    private DeliverService deliverService;
    @Autowired
    private StaffService staffService;
    @Autowired
    private TrainService trainService;
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
    public String addRecruit(String departName,String positionName,Recruit recruit, HttpSession session){
        boolean flag=recruitService.addRecRuit(departName,positionName,recruit);
        if (flag){
            String curentPage="1";
            return adminSeeRecruits(curentPage,session);
        }
        return "addrecruit";
    }
    //发布
    @RequestMapping("updateRecruitState")
    public String updateRecruitState(String recruitId,HttpSession session){
        int recruitId1=Integer.parseInt(recruitId);
        boolean flag=recruitService.updateRecruitState(recruitId1);
        String curentPage="1";
        return adminSeeRecruits(curentPage,session);
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
    //查看招聘投递
    @RequestMapping("adminSeeDeliver")
    public String adminSeeDeliver(String curentPage,HttpSession session){
        int curentPage1=Integer.parseInt(curentPage);
        List<DeliverResume> delivers=deliverService.getDeliverResume();
        int totalRows=delivers.size();
        int PAGESIZE=5;
        int allPages=totalRows%PAGESIZE==0?totalRows/PAGESIZE:totalRows/curentPage1+1;
        List<DeliverResume> deliverList=deliverService.getDeliverResumeCur(curentPage1,PAGESIZE);
        session.setAttribute("deliverList",deliverList);
        session.setAttribute("allPages",allPages);
        return "adminseedeliver";
    }
    //查看投递详情
    @RequestMapping("seeDeliverInfo")
    public String seeDeliverInfo(String deliverId,HttpSession session){
        int deliverId1=Integer.parseInt(deliverId);
        DeliverResume deliverResume=deliverService.getDeliverById(deliverId1);
        if (deliverResume!=null){
            session.setAttribute("deliverResume",deliverResume);
            return "adminseedeliverinfo";
        }
        return "adminseedeliverinfo";
    }
    //发出面试邀请
    @RequestMapping("addInterview")
    public String addInterview(String deliverResumeId,String recruitId,String userId,HttpSession session){
        User user= (User) session.getAttribute("user");
        int deliverResumeId1=Integer.parseInt(deliverResumeId);
        int recruitId1=Integer.parseInt(recruitId);
        int userId1=Integer.parseInt(userId);
        Interview interview=new Interview();
        interview.setAdminId(user.getId());
        interview.setUserId(userId1);
        Recruit recruit=recruitService.seeRecruitById(recruitId1);
        interview.setDepartId(recruit.getDepartId());
        interview.setPositionId(recruit.getPositionId());
        interview.setDeliverResumeId(deliverResumeId1);
        session.setAttribute("interview1",interview);
        return "addinterview";
    }
    @RequestMapping("addInterview1")
    public String addInterview1(Interview interview,HttpSession session){
        interview.setInterviewState(1);
        boolean flag=interviewService.addInterview(interview);
        if (flag){
            session.setAttribute("interview",interview);
            String curentPage="1";
            return adminSeeDeliver(curentPage,session);
        }
        return "addinterview";
    }
    //查看面试邀请
    @RequestMapping("adminSeeInterview")
    public String adminSeeInterview(String curentPage,HttpSession session){
        List<Interview> interviews=interviewService.seeInterview(2);
        int totalRows=interviews.size();
        int curentPage1=Integer.parseInt(curentPage);
        int PAGESIZE=5;
        int allPages=totalRows%PAGESIZE==0?totalRows/PAGESIZE:totalRows/curentPage1+1;
        List<Interview> interviewList=interviewService.seeInterviewCur(2,curentPage1,PAGESIZE);
        session.setAttribute("interviewList",interviewList);
        session.setAttribute("allPages",allPages);
        return "adminseeinterview";
    }
    //查看部门
    @RequestMapping("seeDepart")
    public String seeDepart(HttpSession session){
        List<Depart> departs=departService.seeDepart();
        List<Staff> staffList=staffService.getAllStaff();
        session.setAttribute("staffList",staffList);
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
    //跳到员工操作页面
    @RequestMapping("goStaffCtrl")
    public String goStaffCtrl(String id,HttpSession session){
        Staff staff=new Staff();
        int id1=Integer.parseInt(id);
        staff.setId(id1);
        Staff staff1=staffService.getStaffById(staff);
        List<Depart> departList=departService.seeDepart();
        session.setAttribute("departs",departList);
        session.setAttribute("staff",staff1);
        return "adminctrlstaff";
    }
    //调档
    @RequestMapping("resetDepPos")
    public String resetDepPos(String id,String departName,String positionName,HttpSession session){
        Staff staff=new Staff();
        int id1=Integer.parseInt(id);
        staff.setId(id1);
        Depart depart=departService.getDepartByName(departName);
        Position position=positionService.getPositionByName(positionName);
        staff.setDepartId(depart.getId());
        staff.setPositionId(position.getId());
        boolean flag=staffService.updateStaff(staff);
        return goStaffCtrl(id,session);
    }
    //查看添加培训信息
    @RequestMapping("adminaddtrain")
    public String adminaddtrain(HttpSession session){
        List<Depart> departs=departService.seeDepart();
        List<Train> trains=trainService.seeAllTrain();
        session.setAttribute("trains",trains);
        session.setAttribute("departs",departs);
        return "adminaddtrain";
    }
    //根据部门查员工
    @RequestMapping("getStaffByDep")
    public @ResponseBody List<Staff> getStaffByDep(Depart depart,HttpSession session){
        Depart depart1=departService.getDepartByName(depart.getDepartName());
        List<Staff> list=staffService.getStaffByDep(depart1.getId());
        return list;
    }
}
