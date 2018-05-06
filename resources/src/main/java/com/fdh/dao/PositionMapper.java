package com.fdh.dao;

import com.fdh.model.Depart;
import com.fdh.model.Position;

import java.util.List;

/**
 * Created by Administrator on 2018/4/25 0025.
 */
public interface PositionMapper {
    //根据部门查职位
    List<Position> getPositionsByDep(Position position);
    //通过职位名查职位
    Position getPositionByName(Position position);
    //添加职位
    boolean addPosition(Position position);
    //根据id查职位
    Position getPositionById(int id);
    //删除职位
    boolean deletePositionById(int id);
    //根据部门id查职位
    List<Position> getPositionsByDepId(int departId);
    //查出所有职位
    List<Position> getAllPosition();
}
