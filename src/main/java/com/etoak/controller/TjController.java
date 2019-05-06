package com.etoak.controller;

import com.etoak.service.TjService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by zk on 2018/11/11.
 */
@Controller
@RequestMapping(value ="/tj")
public class TjController {
    @Autowired
    private TjService tjService;

    /*跳转到列表页面*/
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(){
        return "tj/list";
    }
    @ResponseBody
    @RequestMapping(value = "/query",method = RequestMethod.POST)
    /*前端穿过来的参数 当前页面 和 每页记录数 变量名称固定为 page  rows!!!*/
    public Map<String,Object> query(Integer page, Integer rows){
        return tjService.query(page,rows);
    }



}
