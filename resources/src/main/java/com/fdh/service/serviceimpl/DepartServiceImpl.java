package com.fdh.service.serviceimpl;

import com.fdh.dao.DepartMapper;
import com.fdh.model.Depart;
import com.fdh.service.DepartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/25 0025.
 */
@Service
public class DepartServiceImpl implements DepartService {
    @Autowired
    private DepartMapper departMapper;
    //查看职位
    @Override
    public List<Depart> seeDepart() {
        return departMapper.seeDepart();
    }
    //添加部门
    @Override
    public boolean addDepart(Depart depart){
        return departMapper.addDepart(depart);
    }
    //根据部门名查看部门
    @Override
    public Depart getDepartByName(String name) {
        Depart depart=new Depart();
        depart.setDepartName(name);
        return departMapper.getDepartByName(depart);
    }
}
