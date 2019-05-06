package com.etoak.controller;

import com.etoak.bean.Yonghu;
import com.etoak.bean.Zuche;
import com.etoak.service.DcxxService;
import com.etoak.service.ZucheService;
import com.etoak.utils.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by zk on 2018/11/11.
 */
@Controller
@RequestMapping(value ="/zuche")
public class ZucheController {
    @Autowired
    private ZucheService zucheService;
    @Autowired
    private DcxxService dcxxService;

    /*跳转到列表页面*/
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(){
        return "zuche/list";
    }
    /*查询所有员工*/
    @ResponseBody
    @RequestMapping(value = "/query",method = RequestMethod.POST)
    /*前端穿过来的参数 当前页面 和 每页记录数 变量名称固定为 page  rows!!!*/
    public Map<String,Object> query(Integer page,Integer rows,Yonghu yonghu){
        return zucheService.query(page,rows,yonghu);

    }
    @RequestMapping(value = "/empAddAndUpdate",method = RequestMethod.GET)
    public String empAddAndUpdate(Integer id, Model m){
        //返回addAndUpdate页面
        return "zuche/addAndUpdate";
    }

    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public ResultMsg add(Zuche zuche){
        try{
            zuche.setDbno(dcxxService.findDcxxByPrimaryKey(Integer.valueOf(zuche.getDbno())).getBno());//得到的是单车id
            zuche.setState(0);
            if (zuche.getStartTime()==null){
                zuche.setStartTime(new Date());
            }
            int result = zucheService.add(zuche);
            return new ResultMsg(200,"租赁成功！剩余车辆为"+result);
        }catch(Exception ex){
            ex.printStackTrace();
            return new ResultMsg(500,ex.getMessage());
        }
    }
    @ResponseBody
    @RequestMapping(value="/remove",method=RequestMethod.POST)
    public ResultMsg remove(@RequestBody List<String> ids){
        String id = ids.get(0);
       try{
           zucheService.doUpdate(id);
           return new ResultMsg(null,"已限制该用户登录！");
       }catch(Exception ex){
           return new ResultMsg(null,ex.getMessage());
       }
    }



    /*添加前判断用户是否存在 不存在跳转到添加页面 存在添加到model中返回信息 供修改时使用*//*



    *//*修改*//*
    @ResponseBody
    @RequestMapping(value="/update",method=RequestMethod.POST)
    public ResultMsg update(Dcxx dcxx){
        try{
            dcxxService.doUpdate(dcxx);
            return new ResultMsg(200,"修改车辆:"+dcxx.getBxh()+"成功");
        }catch(Exception e){
            e.printStackTrace();
            return new ResultMsg(500,e.getMessage());
        }

    }*/


}
