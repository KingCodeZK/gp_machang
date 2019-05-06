package com.etoak.mapper;

import com.etoak.bean.Dept;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zk on 2018/11/13.
 *
 */
@Repository
public interface DeptMapper {
    //通过pid得到部门信息
    List<Dept> findDeptByPid(@Param("pid") Integer pid);

}
