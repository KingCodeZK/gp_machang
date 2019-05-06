package com.etoak.service;

import com.etoak.bean.Yonghu;

/**
 * Created by zk on 2018/11/10.
 */
public interface YonghuService {
     void add(Yonghu yonghu);
     Yonghu checkByName(String name);
     void updateCanyu(Yonghu yonghu);
}
