package com.fdh.service.serviceimpl;

import com.fdh.dao.DepartMapper;
import com.fdh.dao.PositionMapper;
import com.fdh.model.Depart;
import com.fdh.model.Position;
import com.fdh.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/25 0025.
 */
@Service
public class PositionServiceImpl implements PositionService {
    @Autowired
    private PositionMapper positionMapper;
    @Autowired
    private DepartMapper departMapper;
    //根据部门名查职位
    public List<Position> getPositionsByDep(Depart depart){
        Depart depart1=departMapper.getDepartByName(depart);
        Position position=new Position();
        position.setDepartId(depart1.getId());
        return positionMapper.getPositionsByDep(position);
    }
    //根据部门id查职位
    @Override
    public List<Position> getPositionsByDepId(int departId) {
        return positionMapper.getPositionsByDepId(departId);
    }

    //添加职位
    @Override
    public boolean addPosition(Position position, String departName) {
        Depart depart=new Depart();
        depart.setDepartName(departName);
        Depart depart1=departMapper.getDepartByName(depart);
        position.setDepartId(depart1.getId());
        Position position1=positionMapper.getPositionByName(position);
        if (position1==null){
            return positionMapper.addPosition(position);
        }
        return false;
    }
    //根据名称查职业
    @Override
    public Position getPositionByName(String name) {
        Position position=new Position();
        position.setPositionName(name);
        return positionMapper.getPositionByName(position);
    }
    //删除职位
    @Override
    public boolean deletePositionById(int id) {
        return positionMapper.deletePositionById(id);
    }
    //查出所有职位
    @Override
    public List<Position> getAllPosition() {
        return positionMapper.getAllPosition();
    }
    //根据职位Id查职位
    @Override
    public Position getPositionById(int id) {
        return positionMapper.getPositionById(id);
    }
}
