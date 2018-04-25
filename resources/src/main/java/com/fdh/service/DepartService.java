package com.fdh.service;

import com.fdh.model.Depart;

import java.util.List;

/**
 * Created by Administrator on 2018/4/25 0025.
 */
public interface DepartService {
    //查看职位
    List<Depart> seeDepart();
    //添加部门
    boolean addDepart(Depart depart);
}
