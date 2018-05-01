package com.fdh.controller;

import com.fdh.model.*;
import com.fdh.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
    @Autowired
    private CheckService checkService;
    @Autowired
    private TrainService trainService;
    //跳转到员工
    @RequestMapping("goStaff")
    public String goStaff(){
        return "staff";
    }
    //添加员工
    @RequestMapping("addStaff")
    public String addStaff(String salary,Interview interview, HttpSession session){
        Interview interview1=interviewService.getInterviewById(interview.getId());
        Staff staff=new Staff();
        double salary1=Double.parseDouble(salary);
        boolean flag=staffService.addStaff(salary1,interview1,staff);
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
        List<Staff> staffList=staffService.getAllStaff();
        session.setAttribute("staffList",staffList);
        session.setAttribute("departs",departs);
        return "staffseedeppos";
    }
    //查看员工根据部门
    @RequestMapping("staffSeeStaffByDep")
    public @ResponseBody List<Staff> staffSeeStaffByDep(String departName){
        Depart depart=departService.getDepartByName(departName);
        List<Staff> list=staffService.getStaffByDep(depart.getId());
        return list;
    }
    //查看考勤
    @RequestMapping("seeCheck")
    public String seeCheck(HttpSession session){
        Staff staff= (Staff) session.getAttribute("user");
        List<Check> checkList=checkService.getChecks(staff.getId());
        session.setAttribute("checkList",checkList);
        return "staffseecheck";
    }
    //考勤打卡
    @RequestMapping("addCheck")
    public String addCheck(HttpSession session){
        Staff staff= (Staff) session.getAttribute("user");
        Check check=new Check();
        check.setStaffId(staff.getId());
        boolean flag=checkService.addCheck(check);
        return seeCheck(session);
    }
    //查看培训
    @RequestMapping("seeTrain")
    public String seeTrain(HttpSession session){
        Staff staff= (Staff) session.getAttribute("user");
        List<Train> trainList=trainService.seeTrainByStaff(staff);
        session.setAttribute("trainList",trainList);
        return "staffseetrain";
    }
}
