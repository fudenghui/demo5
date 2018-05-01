package com.fdh.dao;

import com.fdh.model.Staff;
import com.fdh.model.Train;

import java.util.List;

/**
 * Created by Administrator on 2018/4/24 0024.
 */
public interface TrainMapper {
    //查询培训信息
    Train seeTrain(Train train);
    //查询所有培训信息
    List<Train> seeAllTrain();
    //添加培训信息
    boolean addTrain(Train train);
    //员工查询培训
    List<Train> seeTrainByStaff(Staff staff);
}
