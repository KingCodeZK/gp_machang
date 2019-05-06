package com.etoak.service;

import com.etoak.bean.Yonghu;
import com.etoak.bean.Zuche;

import java.util.List;
import java.util.Map;

/**
 * Created by zk on 2018/11/16.
 */
public interface ZucheService {
    Map<String,Object> query(Integer pageNumber, Integer pageSize, Yonghu yonghu);
    Zuche findZucheByPrimaryKey(Integer id);
    int add(Zuche zuche);
  //Zuche getZuche(String gys);
    int doRemove(List<Integer> ids);
    void doUpdate(String id);
    Zuche querySysl(String dbno);

}
