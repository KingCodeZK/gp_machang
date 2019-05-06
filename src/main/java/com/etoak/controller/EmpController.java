package com.etoak.controller;

import com.etoak.bean.Emp;
import com.etoak.service.EmpService;
import com.etoak.utils.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by zk on 2018/11/11.
 */
@Controller
@RequestMapping(value ="/emp")
public class EmpController {
    @Autowired
    private EmpService empService;
    /*跳转到列表页面*/
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(){
        return "emp/list";
    }
    /*查询所有员工*/
    @ResponseBody
    @RequestMapping(value = "/query",method = RequestMethod.POST)
    /*前端穿过来的参数 当前页面 和 每页记录数 变量名称固定为 page  rows!!!*/
    public Map<String,Object> query(Integer page,Integer rows,Emp emp){
        return empService.query(page,rows,emp);
    }
    /*添加前判断用户是否存在 不存在跳转到添加页面 存在添加到model中返回信息 供修改时使用*/
    @RequestMapping(value = "/empAddAndUpdate",method = RequestMethod.GET)
    public String empAddAndUpdate(Integer id, Model m){
        //判断id是否存在
        if (id!=null){
            //存在的话 添加 员工信息到model
            Emp emp = empService.findEmpByPrimaryKey(id);
            m.addAttribute("e",emp);
        }
        //返回addAndUpdate页面
        return "emp/addAndUpdate";
    }
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public ResultMsg add(Emp emp){
        empService.add(emp);
        return new ResultMsg(200,"新增员工"+emp.getEname()+"成功！");
    }


}
