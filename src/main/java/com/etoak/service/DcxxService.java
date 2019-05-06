package com.etoak.service;

import com.etoak.bean.Dcxx;
import com.etoak.bean.Xuqiu;
import com.etoak.utils.TreeNode;

import java.util.List;
import java.util.Map;

/**
 * Created by zk on 2018/11/16.
 */
public interface DcxxService {
    Map<String,Object> query(Integer pageNumber, Integer pageSize, Xuqiu xuqiu);
    Dcxx findDcxxByPrimaryKey(Integer id);
    int add(Dcxx dcxx);
    Dcxx getBXH(String gys);
    int doRemove(List<String> ids);
    void doUpdate(Dcxx dcxx);
    List<TreeNode> findDcxxByPid(Integer id);
}
