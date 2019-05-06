package com.etoak.service.impl;

import com.etoak.bean.Emp;
import com.etoak.mapper.EmpMapper;
import com.etoak.service.EmpService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zk on 2018/11/11.
 */
@Service
public class EmpServiceImpl implements EmpService{
    @Autowired
    private EmpMapper empMapper;
    @Override
    public Map<String, Object> query(Integer page, Integer rows, Emp emp) {
        PageHelper.startPage(page,rows);
        List<Emp> list = empMapper.query(emp);
        PageInfo<Emp> pi = new PageInfo<>(list);

        Map<String,Object> result = new HashMap<>();
        result.put("rows",list);
        result.put("total",pi.getTotal());
        return result;
    }

    @Override
    public Emp findEmpByPrimaryKey(Integer id) {
        return empMapper.findEmpByPrimaryKey(id);
    }

    @Override
    public int add(Emp emp) {
        emp.setHiredate(new Date());
        return empMapper.add(emp);
    }
}
