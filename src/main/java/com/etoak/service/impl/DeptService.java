package com.etoak.service.impl;

import com.etoak.bean.Dept;
import com.etoak.mapper.DeptMapper;
import com.etoak.utils.TreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by zk on 2018/11/14.
 */
@Service
public class DeptService implements com.etoak.service.DeptService{
    @Autowired
    private DeptMapper deptMapper;
    /*
    * 通过pid查询部门信息 然后拼成tree组件 展示部门信息
    * */
    @Override
    public List<TreeNode> findDeptByPid(Integer id) {
        //定义TreeNode集合
        List<TreeNode> trees = Collections.EMPTY_LIST;
        //通过pid查找部门信息
        List<Dept> list = deptMapper.findDeptByPid(id);
        //判断list是否为空
        if(list.size()>0&&list!=null){
            //创建集合对象
            trees = new ArrayList<>();
            //定义Tree对象
            TreeNode tree = null;
            //遍历结果集
            for (Dept dept:list){
                //创建对象
                tree = new TreeNode();
                //tree主键
                tree.setId(dept.getId());
                //tree名称（部门名称）
                tree.setText(dept.getDname());
                //判断当前节点下  是否有子节点
                List<Dept> count = deptMapper.findDeptByPid(dept.getPid());
                //设置状态 open closed  如果有子节点不自动展开该节点
                tree.setState(count==null||count.size()==0?"open":"closed");
                //组装
                trees.add(tree);
            }

        }
        return trees;
    }
}
