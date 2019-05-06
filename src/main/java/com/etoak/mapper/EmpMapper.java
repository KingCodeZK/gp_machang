package com.etoak.mapper;

import com.etoak.bean.Emp;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zk on 2018/11/11.
 */
@Repository
public interface EmpMapper {
    List<Emp> query(Emp emp);
    Emp findEmpByPrimaryKey(Integer id);
    int add(Emp emp);
}
