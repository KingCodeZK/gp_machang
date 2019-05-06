package com.etoak.service;


import com.etoak.bean.Xiaoxi;
import com.etoak.bean.Xuqiu;

import java.util.Map;

/**
 * Created by zk on 2018/11/10.
 */
public interface XuqiuService {
    void add(Xuqiu xuqiu);
    Map<String,Object> query(Integer pageNumber, Integer pageSize, Xuqiu xuqiu);
    Xuqiu queryInfoById(Xuqiu xuqiu);
    void update(Xuqiu xuqiu);
    Map<String,Object> queryAllType();
    void updateCanyu(Xuqiu xuqiu);
    void updateXuqiu(Xuqiu xuqiu);
    void addXiaoxi(Xiaoxi xiaoxi);
    Map<String,Object> queryXiaoxi(Xiaoxi xiaoxi);
}
