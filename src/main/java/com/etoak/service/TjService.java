package com.etoak.service;

import java.util.Map;

/**
 * Created by zk on 2018/11/16.
 */
public interface TjService {
    Map<String,Object> query(Integer pageNumber, Integer pageSize);
}
