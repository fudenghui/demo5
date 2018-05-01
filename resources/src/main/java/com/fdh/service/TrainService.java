package com.fdh.service;

import com.fdh.model.Staff;
import com.fdh.model.Train;

import java.util.List;

/**
 * Created by Administrator on 2018/4/27 0027.
 */
public interface TrainService {
    //查询所有培训信息
    List<Train> seeAllTrain();
    //添加培训信息
    boolean addTrain(String[] staffIds,Train train);
    //员工查询培训
    List<Train> seeTrainByStaff(Staff staff);
}
