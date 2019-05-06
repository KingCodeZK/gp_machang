package com.etoak.mapper;

import com.etoak.bean.Dcxx;
import com.etoak.bean.Xuqiu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zk on 2018/11/11.
 */
@Repository
public interface DcxxMapper {
    List<Xuqiu> query(Xuqiu xuqiu);
    Dcxx findEmpByPrimaryKey(Integer id);
    int add(Dcxx dcxx);
    Dcxx getBXH(String gys);
    int remove(@Param("ids") List<String> ids);
    int update(Dcxx dcxx);
    List<Dcxx> findDcxxByPid(Integer pid);
    Dcxx findDcxxBno(String bno);
    int updateSyslJia(Dcxx dcxx);
}
