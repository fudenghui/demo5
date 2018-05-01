package com.fdh.service.serviceimpl;

import com.fdh.dao.WardPunishMapper;
import com.fdh.model.WardPunish;
import com.fdh.service.WardPunishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/28 0028.
 */
@Service
public class WardPunishServiceImpl implements WardPunishService {
    @Autowired
    private WardPunishMapper wardPunishMapper;
    //查询奖惩
    @Override
    public List<WardPunish> getAllWardPu() {
        return wardPunishMapper.getAllWardPu();
    }
    //添加奖惩
    @Override
    public boolean addWardPunish(WardPunish wardPunish) {
        if (wardPunish.getPunish()==0&&wardPunish.getWard()!=0){
            return wardPunishMapper.addWardPunishForWard(wardPunish);
        }else if (wardPunish.getWard()==0&&wardPunish.getPunish()!=0){
            return wardPunishMapper.addWardPunishForPunish(wardPunish);
        }else if (wardPunish.getPunish()!=0&&wardPunish.getWard()!=0){
            return wardPunishMapper.addWardPunish(wardPunish);
        }else {
            return false;
        }

    }
}
