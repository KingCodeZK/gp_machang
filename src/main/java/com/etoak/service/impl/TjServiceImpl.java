package com.etoak.service.impl;

import com.etoak.bean.Yonghu;
import com.etoak.bean.Zuche;
import com.etoak.mapper.DcxxMapper;
import com.etoak.mapper.TjMapper;
import com.etoak.service.TjService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zk on 2018/11/11.
 */
@Service
public class TjServiceImpl implements TjService{
    @Autowired
    private TjMapper tjMapper;
    @Autowired
    private DcxxMapper dcxxMapper;

    @Override
    public Map<String, Object> query(Integer pageNumber, Integer pageSize) {

        List<Yonghu> list = tjMapper.query();
        Map<String,Object> result = new HashMap<>();
        result.put("rows",list);
        return result;
    }
}
