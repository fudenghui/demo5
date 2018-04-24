package com.fdh.service.serviceimpl;

import com.fdh.dao.RecruitMapper;
import com.fdh.model.Recruit;
import com.fdh.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/23 0023.
 */
@Service
public class RecruitServiceImpl implements RecruitService {
    @Autowired
    private RecruitMapper recruitMapper;
    //查看招聘信息
    @Override
    public List<Recruit> seeRecruit() {
        return recruitMapper.seeRecruit();
    }
    //查看招聘信息当前页
    @Override
    public List<Recruit> seeRecruitCur(int curentPage, int PAGESIZE) {
        int firstRow=(curentPage-1)*PAGESIZE+1;
        int lastRow=curentPage*PAGESIZE;
        return recruitMapper.seeRecruitCur(firstRow,lastRow);
    }
    //通过id查看招聘信息
    @Override
    public Recruit seeRecruitById(int id) {
        Recruit recruit=new Recruit();
        recruit.setId(id);
        return recruitMapper.seeRecruitById(recruit);
    }
    //添加招聘信息
    @Override
    public boolean addRecRuit(Recruit recruit) {
        return recruitMapper.addRecRuit(recruit);
    }
}
