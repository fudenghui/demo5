package com.fdh.service.serviceimpl;

import com.fdh.dao.DeliverMapper;
import com.fdh.model.DeliverResume;
import com.fdh.service.DeliverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/26 0026.
 */
@Service
public class DeliverServiceImpl implements DeliverService {
    @Autowired
    private DeliverMapper deliverMapper;
    //获取投递信息
    @Override
    public List<DeliverResume> getDeliverResume() {
        return deliverMapper.getDeliverResume();
    }
    //获取投递信息当前页
    @Override
    public List<DeliverResume> getDeliverResumeCur(int curentPage, int PAGESIZE) {
        int firstRow=(curentPage-1)*PAGESIZE+1;
        int lastRow=curentPage*PAGESIZE;
        return deliverMapper.getDeliverResumeCur(firstRow,lastRow);
    }
    //根据id获取投递信息
    @Override
    public DeliverResume getDeliverById(int id) {
        return deliverMapper.getDeliverById(id);
    }
}
