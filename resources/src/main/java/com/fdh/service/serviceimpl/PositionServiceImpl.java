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
}
