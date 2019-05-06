package com.etoak.mapper;

import com.etoak.bean.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zk on 2018/11/10.
 */
@Repository
public interface UserMapper {
    int add(User user);
    List<User> selectPage();
    int update(User user);
    int delete(Integer id);

}
