package com.etoak.service;

import com.etoak.bean.Emp;

import java.util.Map;

/**
 * Created by zk on 2018/11/11.
 */
public interface EmpService {
    Map<String,Object> query(Integer pageNumber, Integer pageSize, Emp emp);
    Emp findEmpByPrimaryKey(Integer id);
    int add(Emp emp);
}
