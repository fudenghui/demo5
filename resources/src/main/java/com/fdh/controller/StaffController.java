package com.fdh.controller;

import com.fdh.model.Depart;
import com.fdh.model.Interview;
import com.fdh.model.Position;
import com.fdh.model.Staff;
import com.fdh.service.DepartService;
import com.fdh.service.InterviewService;
import com.fdh.service.PositionService;
import com.fdh.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.dc.pr.PRError;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
@Controller
public class StaffController {
    @Autowired
    private StaffService staffService;
    @Autowired
    private InterviewService interviewService;
    @Autowired
    private DepartService departService;
    @Autowired
    private PositionService positionService;
    //添加员工
    @RequestMapping("addStaff")
    public String addStaff(Interview interview, HttpSession session){
        Interview interview1=interviewService.getInterviewById(interview.getId());
        Staff staff=new Staff();
        boolean flag=staffService.addStaff(interview,staff);
        if (flag){
            return "seedeppos";
        }
        return "adminseeinterview";
    }
    //跳转到员工中心
    @RequestMapping("goStaffInfo")
    public String goStaffInfo(){
        return "staff";
    }
    //修改员工信息
    @RequestMapping("updateStaff")
    public String updateStaff(Staff staff, HttpSession session){
        Staff staff1= (Staff) session.getAttribute("user");
        staff.setName(staff1.getName());
        boolean flag=staffService.updateStaff(staff);
        if (flag){
            Staff staff2=staffService.getStaffByName(staff);
            session.setAttribute("user",staff2);
            return "staffinfo";
        }else {
            return "staffinfo";
        }
    }
    //查看部门
    @RequestMapping("staffSeeDepart")
    public String staffSeeDepart(HttpSession session){
        List<Depart> departs=departService.seeDepart();
        session.setAttribute("departs",departs);
        return "seedeppos";
    }
}
