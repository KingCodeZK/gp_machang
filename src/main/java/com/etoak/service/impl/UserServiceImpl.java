package com.etoak.service.impl;

import com.etoak.bean.User;
import com.etoak.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by zk on 2018/11/10.
 */
@Service
public class UserServiceImpl implements com.etoak.service.UserService{
    @Autowired
    private UserMapper userMapper;
    @Override
    public void add(User user) {
        int result = userMapper.add(user);
        if (result<=0){
            throw new RuntimeException("新增用户"+user.getName()+"失败！");
        }

    }
}
