package com.fdh.service;

import com.fdh.model.Depart;
import com.fdh.model.Position;

import java.util.List;

/**
 * Created by Administrator on 2018/4/25 0025.
 */
public interface PositionService {
    //根据部门名查职位
    List<Position> getPositionsByDep(Depart depart);
    //添加职位
    boolean addPosition(Position position,String departName);
}
