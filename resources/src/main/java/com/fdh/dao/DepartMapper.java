package com.fdh.dao;

import com.fdh.model.Depart;

import java.util.List;

/**
 * Created by Administrator on 2018/4/25 0025.
 */
public interface DepartMapper {
    //查看部门
    List<Depart> seeDepart();
    //根据名字查部门
    Depart getDepartByName(Depart depart);
    //添加部门
    boolean addDepart(Depart depart);
    //删除部门
    boolean deleteDepartById(int id);
}
