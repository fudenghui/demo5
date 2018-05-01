package com.fdh.service;

import com.fdh.model.WardPunish;

import java.util.List;

/**
 * Created by Administrator on 2018/4/28 0028.
 */
public interface WardPunishService {
    //查询奖惩
    List<WardPunish> getAllWardPu();
    //添加奖惩
    boolean addWardPunish(WardPunish wardPunish);
}
