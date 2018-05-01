package com.fdh.service;

import com.fdh.model.Depart;

import java.util.List;

/**
 * Created by Administrator on 2018/4/25 0025.
 */
public interface DepartService {
    //查看部门
    List<Depart> seeDepart();
    //添加部门
    boolean addDepart(Depart depart);
    //根据部门名查看部门
    Depart getDepartByName(String name);
    //删除部门
    boolean deleteDepartById(int id);
}
