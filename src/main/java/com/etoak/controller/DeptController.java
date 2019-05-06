package com.etoak.controller;


import com.etoak.service.DeptService;
import com.etoak.utils.TreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by zk on 2018/11/13.
 */
@Controller
@RequestMapping(value = "dept")
public class DeptController {
    //注入对象
    @Autowired
    private DeptService deptService;
    @ResponseBody
    @RequestMapping(value = "getDept",method= RequestMethod.POST)
    //元素设置默认值为0
    public List<TreeNode> getDept(@RequestParam(value = "id",defaultValue ="0") Integer id){
        return deptService.findDeptByPid(id);
    }
}
