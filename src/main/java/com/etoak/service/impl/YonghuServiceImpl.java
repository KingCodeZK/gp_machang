package com.etoak.service.impl;

import com.etoak.bean.Yonghu;
import com.etoak.mapper.YonghuMapper;
import com.etoak.service.YonghuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 18053 on 2019/4/20.
 */
@Service
public class YonghuServiceImpl implements YonghuService {
    @Autowired
    private YonghuMapper yonghuMapper;
    @Override
    public void add(Yonghu yonghu){
        int result = yonghuMapper.add(yonghu);
        if (result<=0){
            throw new RuntimeException("新增用户"+yonghu.getName()+"失败！");
        }
    }

    @Override
    public Yonghu checkByName(String name) {
            return yonghuMapper.checkByName(name);
    }

    @Override
    public void updateCanyu(Yonghu yonghu) {
        int result = yonghuMapper.updateCanyu(yonghu);
        if (result<=0){
            throw  new RuntimeException("参与项目失败！");
        }
    }

}
