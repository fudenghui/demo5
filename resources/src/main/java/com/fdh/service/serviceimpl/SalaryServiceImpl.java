package com.fdh.service.serviceimpl;

import com.fdh.dao.CheckMapper;
import com.fdh.dao.SalaryMapper;
import com.fdh.dao.WardPunishMapper;
import com.fdh.model.Check;
import com.fdh.model.Salary;
import com.fdh.model.WardPunish;
import com.fdh.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/5/2 0002.
 */
@Service
public class SalaryServiceImpl implements SalaryService {
    @Autowired
    private SalaryMapper salaryMapper;
    @Autowired
    private WardPunishMapper wardPunishMapper;
    @Autowired
    private CheckMapper checkMapper;
    @Override
    public List<Salary> getSalarys(String salaryDate) {
        return salaryMapper.getSalarys(salaryDate);
    }
    //添加薪资单
    @Override
    public boolean addSalary(Salary salary) {
        String str1=salary.getSalaryDate().replace("年","-");
        String str2=str1.replace("月","-");
        String[] strArray=str2.split("-");
        int month=Integer.parseInt(strArray[1]);
        String startTime=str2+"01 00:00:00";
        String endTime=strArray[0]+"-"+(month+1)+"-01 00:00:00";
        List<WardPunish> wardPunishes=wardPunishMapper.getWardPunish(salary.getStaffId(),startTime,endTime);
        double allWard=0;
        double allPunish=0;
        for (int i=0;i<wardPunishes.size();i++){
            WardPunish wardPunish=wardPunishes.get(i);
            allWard=allWard+wardPunish.getWard();
            allPunish=allPunish+wardPunish.getPunish();
        }
        salary.setWard(allWard);
        List<Check> checkList=checkMapper.seeCheck(salary.getStaffId(),startTime,endTime);
        int count=0;
        double money=salary.getBaseSal()/22;
        double lowMoney=0;
        if (checkList.size()<22){
            lowMoney=money*(22-checkList.size())*2;
        }
        allPunish=allPunish+lowMoney;
        salary.setPunish(allPunish);
        for (int i=0;i<checkList.size();i++){
            Check check=checkList.get(i);
            if (check.getOnworkState().equals("旷工")||check.getOutworkState().equals("旷工")){
                continue;
            }else {
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String time=sdf.format(check.getOutWorkTime());
                String time1=time.substring(0,11);
                String time2=time1+"21:00:00";
                Date timeDate=null;
                try {
                    timeDate=sdf.parse(time2);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                if (check.getOutWorkTime().after(timeDate)){
                    count++;
                }
            }
        }
        double money1=count*15;
        salary.setOverTime(money1);
        double money2=salary.getBaseSal()+salary.getPerformance()+allWard+money1;
        salary.setAllMoney(money2-allPunish);
        return false;
    }
}
