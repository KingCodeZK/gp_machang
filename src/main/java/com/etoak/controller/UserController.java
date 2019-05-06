package com.etoak.controller;

import com.etoak.bean.User;
import com.etoak.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by zk on 2018/11/10.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Autowired
    public UserService service;
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Map<String,Object> add(User user){
        Map<String,Object> result = new HashMap<>();
        try{
            service.add(user);
            result.put("flag","success");
            result.put("msg","新增用户"+user.getName()+"成功！");
        }catch(Exception ex){
            ex.printStackTrace();
            result.put("flag","error");
            result.put("msg", ex.getMessage());
        }
        return result;

    }


}
