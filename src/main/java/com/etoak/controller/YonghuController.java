package com.etoak.controller;

import com.etoak.bean.Yonghu;
import com.etoak.service.YonghuService;
import com.etoak.utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by zk on 2018/11/10.
 */
@Controller
@RequestMapping(value = "/yonghu")
public class YonghuController {
    @Autowired
    public YonghuService yonghuService;
    @ResponseBody
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public Map<String, Object> add(Yonghu yonghu, @RequestParam(value = "username")String name,@RequestParam(value="email")String youxiang){
        Map<String,Object> result = new HashMap<>();
            yonghu.setName(name);
            yonghu.setYouxiang(youxiang);
            Yonghu user = yonghuService.checkByName(yonghu.getName());
            System.out.print(user);
            if(user==null){
                //生成需求主键
                String yonghuuuid = UUID.randomUUID().toString().replaceAll("-","");
                yonghu.setId(yonghuuuid);
                yonghu.setPassword(MD5.getMD5(yonghu.getPassword()));
                yonghuService.add(yonghu);
                result.put("status","success");
                return result;
            }
                result.put("status","fail");
                return result;




    }
    @ResponseBody
    @RequestMapping(value = "/login1",method = RequestMethod.POST)
    public Map<String, Object> login(@RequestParam(value = "username")String name, @RequestParam(value = "password")String password, HttpSession session){
        Map<String,Object> result = new HashMap<>();
        Yonghu newUser = yonghuService.checkByName(name);
        if(newUser==null){
            result.put("status","bucunzai");
            return result;
        }else if(!MD5.getMD5(password).equals(newUser.getPassword())){
            result.put("status","fail");
            return result;
        }else if("1".equals(newUser.getTest2())){
            result.put("status","beixianzhi");
            return result;
        }
        newUser.setPassword(null);
        session.setAttribute("user",newUser);
        result.put("status","success");
        return result;
    }


}
