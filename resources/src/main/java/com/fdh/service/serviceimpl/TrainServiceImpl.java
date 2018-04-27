package com.fdh.service.serviceimpl;

import com.fdh.dao.TrainMapper;
import com.fdh.model.Train;
import com.fdh.service.TrainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/27 0027.
 */
@Service
public class TrainServiceImpl implements TrainService {
    @Autowired
    private TrainMapper trainMapper;
    //查询所有培训信息
    @Override
    public List<Train> seeAllTrain() {
        return trainMapper.seeAllTrain();
    }
}
