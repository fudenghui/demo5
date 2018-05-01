package com.fdh.service.serviceimpl;

import com.fdh.dao.CheckMapper;
import com.fdh.dao.PositionMapper;
import com.fdh.dao.StaffMapper;
import com.fdh.dao.WardPunishMapper;
import com.fdh.model.Check;
import com.fdh.model.Position;
import com.fdh.model.Staff;
import com.fdh.model.WardPunish;
import com.fdh.service.CheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.SpringTransactionAnnotationParser;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/4/30 0030.
 */
@Service
public class CheckServiceImpl implements CheckService {
    @Autowired
    private CheckMapper checkMapper;
    @Autowired
    private StaffMapper staffMapper;
    @Autowired
    private PositionMapper positionMapper;
    @Autowired
    private WardPunishMapper wardPunishMapper;
    //添加打卡记录
    @Override
    public boolean addCheck(Check check) {
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime=sdf.format(date);
        String str=nowTime.substring(0,11);
        String startTime=str+"00:00:00";
        String endTime=str+"23:59:59";
//        int hourNum=Integer.parseInt(hourNumStr);
        Check check1=checkMapper.getCheckByStaff(check.getStaffId(),startTime,endTime);
        if (check1!=null){
            Date pmTimeDate=null;
            Date pmTimeDate1=null;
            Date pmTimeDate2=null;
            Date pmTimeDate3=null;
            try {
                String pmTime=str+"18:00:00";
                pmTimeDate=sdf.parse(pmTime);
                String pmTime1=str+"17:00:00";
                pmTimeDate1=sdf.parse(pmTime1);
                String pmTime2=str+"16:00:00";
                pmTimeDate2=sdf.parse(pmTime2);
                String pmTime3=str+"15:00:00";
                pmTimeDate3=sdf.parse(pmTime3);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            if (check1.getOnworkState().equals("旷工")){
                check1.setOutWorkTime(date);
                if (date.after(pmTimeDate)){
                    check1.setOutworkState("正常");
                    return checkMapper.updateCheckForPm(check1);
                }else if (date.after(pmTimeDate1)){
                    check1.setOutworkState("早退1小时");
                    return checkMapper.updateCheckForPm(check1);
                }else if (date.after(pmTimeDate2)){
                    check1.setOnworkState("早退2小时");
                    return checkMapper.updateCheckForPm(check1);
                }else if (date.after(pmTimeDate3)){
                    check1.setOnworkState("早退3小时");
                    return checkMapper.updateCheckForPm(check1);
                }else {
                    check1.setOnworkState("旷工");
                    return checkMapper.updateCheckForPm(check1);
                }
            }else {
                Staff staff=new Staff();
                staff.setId(check.getStaffId());
                Staff staff1=staffMapper.getStaffById(staff);
                double money=staff1.getSalary()/22;
                check1.setOutWorkTime(date);
                if (date.after(pmTimeDate)){
                    check1.setOutworkState("正常");
                    return checkMapper.updateCheckForPm(check1);
                }else if (date.after(pmTimeDate1)){
                    check1.setOutworkState("早退1小时");
                    boolean flag=checkMapper.updateCheckForPm(check1);
                    if (flag){
                        //添加惩罚记录
                        WardPunish wardPunish=new WardPunish();
                        wardPunish.setStaffId(check.getStaffId());
                        double money1=money/8;
                        wardPunish.setPunish(money1);
                        wardPunish.setPunishDes("早退1小时");
                        wardPunish.setWardPunishTime(nowTime);
                        return wardPunishMapper.addWardPunishForPunish(wardPunish);
                    }
                }else if (date.after(pmTimeDate2)){
                    check1.setOnworkState("早退2小时");
                    boolean flag=checkMapper.updateCheckForPm(check1);
                    if (flag){
                        //添加惩罚记录
                        WardPunish wardPunish=new WardPunish();
                        wardPunish.setStaffId(check.getStaffId());
                        double money1=(money/8)*2;
                        wardPunish.setPunish(money1);
                        wardPunish.setPunishDes("早退2小时");
                        wardPunish.setWardPunishTime(nowTime);
                        return wardPunishMapper.addWardPunishForPunish(wardPunish);
                    }
                }else if (date.after(pmTimeDate3)){
                    check1.setOnworkState("早退3小时");
                    boolean flag=checkMapper.updateCheckForPm(check1);
                    if (flag){
                        //添加惩罚记录
                        WardPunish wardPunish=new WardPunish();
                        wardPunish.setStaffId(check.getStaffId());
                        double money1=(money/8)*3;
                        wardPunish.setPunish(money1);
                        wardPunish.setPunishDes("早退3小时");
                        wardPunish.setWardPunishTime(nowTime);
                        return wardPunishMapper.addWardPunishForPunish(wardPunish);
                    }
                }else {
                    check1.setOnworkState("旷工");
                    boolean flag=checkMapper.updateCheckForPm(check1);
                    if (flag){
                        //添加惩罚记录
                        WardPunish wardPunish=new WardPunish();
                        wardPunish.setStaffId(check.getStaffId());
                        wardPunish.setPunish(money);
                        wardPunish.setPunishDes("旷工");
                        wardPunish.setWardPunishTime(nowTime);
                        //查询当天早上打卡惩罚记录
                        List<WardPunish> list=wardPunishMapper.getWardPunish(check1.getStaffId(),startTime,endTime);
                        if (list.size()!=0) {
                            for (int i = 0; i < list.size(); i++) {
                                WardPunish wardPunish1 = list.get(i);
                                if (wardPunish1.getPunishDes().equals("迟到1小时") || wardPunish1.getPunishDes().equals("迟到2小时") || wardPunish1.getPunishDes().equals("迟到3小时")) {
                                    wardPunish1.setPunish(0);
                                    boolean flag1 = wardPunishMapper.updateWardPunishForPu(wardPunish1);
                                    if (flag1) {
                                        return wardPunishMapper.addWardPunishForPunish(wardPunish);
                                    }
                                }
                            }
                        }
                        return wardPunishMapper.addWardPunishForPunish(wardPunish);
                    }
                }
            }
        }else {
            check.setOnWorkTime(date);
            check.setCheckDate(date);
            try {
                String amTime=str+"9:00:00";
                Date amTimeDate=sdf.parse(amTime);
                String amTime1=str+"10:00:00";
                Date amTimeDate1=sdf.parse(amTime1);
                String amTime2=str+"11:00:00";
                Date amTimeDate2=sdf.parse(amTime2);
                String amTime3=str+"12:00:00";
                Date amTimeDate3=sdf.parse(amTime3);
                Staff staff=new Staff();
                staff.setId(check.getStaffId());
                Staff staff1=staffMapper.getStaffById(staff);
                double money=staff1.getSalary()/22;
                if (date.after(amTimeDate3)){
                    check.setOnworkState("旷工");
                    //添加惩罚记录
                    WardPunish wardPunish=new WardPunish();
                    wardPunish.setStaffId(check.getStaffId());
                    wardPunish.setPunish(money);
                    wardPunish.setPunishDes("旷工");
                    wardPunish.setWardPunishTime(nowTime);
                    boolean flag=checkMapper.addCheckForAm(check);
                    if (flag){
                        return wardPunishMapper.addWardPunishForPunish(wardPunish);
                    }
                    return false;
                }else if (date.after(amTimeDate2)){
                    check.setOnworkState("迟到3小时");
                    //添加惩罚记录
                    WardPunish wardPunish=new WardPunish();
                    wardPunish.setStaffId(check.getStaffId());
                    double money1=(money/8)*3;
                    wardPunish.setPunish(money1);
                    wardPunish.setPunishDes("迟到3小时");
                    wardPunish.setWardPunishTime(nowTime);
                    boolean flag=checkMapper.addCheckForAm(check);
                    if (flag){
                        return wardPunishMapper.addWardPunishForPunish(wardPunish);
                    }
                    return false;
                }else if (date.after(amTimeDate1)){
                    check.setOnworkState("迟到2小时");
                    //添加惩罚记录
                    WardPunish wardPunish=new WardPunish();
                    wardPunish.setStaffId(check.getStaffId());
                    double money1=(money/8)*2;
                    wardPunish.setPunish(money1);
                    wardPunish.setPunishDes("迟到2小时");
                    wardPunish.setWardPunishTime(nowTime);
                    boolean flag=checkMapper.addCheckForAm(check);
                    if (flag){
                        return wardPunishMapper.addWardPunishForPunish(wardPunish);
                    }
                    return false;
                }else if (date.after(amTimeDate)){
                    check.setOnworkState("迟到1小时");
                    //添加惩罚记录
                    WardPunish wardPunish=new WardPunish();
                    wardPunish.setStaffId(check.getStaffId());
                    double money1=money/8;
                    wardPunish.setPunish(money1);
                    wardPunish.setPunishDes("迟到1小时");
                    wardPunish.setWardPunishTime(nowTime);
                    boolean flag=checkMapper.addCheckForAm(check);
                    if (flag){
                        return wardPunishMapper.addWardPunishForPunish(wardPunish);
                    }
                    return false;
                }else {
                    check.setOnworkState("正常");
                    return checkMapper.addCheckForAm(check);
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
    //查看考勤
    @Override
    public List<Check> getChecks(int staffId) {
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime=sdf.format(date);
        String str1=nowTime.substring(5,7);
        String str2=nowTime.substring(0,8);
        String str3=nowTime.substring(0,5);
        int month=Integer.parseInt(str1);
        String startTime=str2+"01 00:00:00";
        String endTime ="";
        if (month<12) {
            endTime = "" + str3 + (month + 1)+"-01 00:00:00";
        }else {
            endTime = "" + str3 +"01-01 00:00:00";
        }
        List<Check> checkList=checkMapper.seeCheck(staffId,startTime,endTime);
        return checkList;
    }
}
