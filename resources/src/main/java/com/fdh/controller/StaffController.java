package com.fdh.controller;

import com.fdh.model.Staff;
import com.fdh.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
@Controller
public class StaffController {
    @Autowired
    private StaffService staffService;
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
}
