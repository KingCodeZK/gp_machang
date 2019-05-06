package com.etoak.service;

import com.etoak.utils.TreeNode;

import java.util.List;

/**
 * Created by zk on 2018/11/14.
 */
public interface DeptService {
    List<TreeNode> findDeptByPid(Integer id);

}
