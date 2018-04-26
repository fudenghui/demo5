package com.fdh.service.serviceimpl;

import com.fdh.dao.DepartMapper;
import com.fdh.dao.PositionMapper;
import com.fdh.dao.RecruitMapper;
import com.fdh.model.Depart;
import com.fdh.model.Position;
import com.fdh.model.Recruit;
import com.fdh.service.RecruitService;
import org.omg.PortableServer.POA;
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
    @Autowired
    private DepartMapper departMapper;
    @Autowired
    private PositionMapper positionMapper;
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
    //查看招聘信息
    @Override
    public List<Recruit> seeRecruitByState() {
        return recruitMapper.seeRecruitByState();
    }
    //查看招聘信息当前页
    @Override
    public List<Recruit> seeRecruitCurByState(int curentPage, int PAGESIZE) {
        int firstRow=(curentPage-1)*PAGESIZE+1;
        int lastRow=curentPage*PAGESIZE;
        return recruitMapper.seeRecruitCurByState(firstRow,lastRow);
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
    public boolean addRecRuit(String departName,String positionName,Recruit recruit) {
        Depart depart=new Depart();
        depart.setDepartName(departName);
        Depart depart1=departMapper.getDepartByName(depart);
        Position position=new Position();
        position.setPositionName(positionName);
        Position position1=positionMapper.getPositionByName(position);
        recruit.setDepartId(depart1.getId());
        recruit.setPositionId(position1.getId());
        recruit.setRecruitState(0);
        return recruitMapper.addRecRuit(recruit);
    }
    //发布
    @Override
    public boolean updateRecruitState(int recruitId) {
        Recruit recruit=new Recruit();
        recruit.setId(recruitId);
        recruit.setRecruitState(1);
        return false;
    }
}
