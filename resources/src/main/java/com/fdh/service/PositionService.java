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
    //根据部门id查职位
    List<Position> getPositionsByDepId(int departId);
    //添加职位
    boolean addPosition(Position position,String departName);
    //根据名称查职业
    Position getPositionByName(String name);
    //删除职位
    boolean deletePositionById(int id);
    //查出所有职位
    List<Position> getAllPosition();
    //根据职位Id查职位
    Position getPositionById(int id);
}
