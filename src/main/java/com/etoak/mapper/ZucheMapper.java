package com.etoak.mapper;

import com.etoak.bean.Yonghu;
import com.etoak.bean.Zuche;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zk on 2018/11/11.
 */
@Repository
public interface ZucheMapper {
    List<Yonghu> query(Yonghu yonghu);
    Zuche findZucheByPrimaryKey(Integer id);
    int add(Zuche zuche);
    Zuche getBXH(String bxh);
    int remove(@Param("ids") List<Integer> ids);
    int update(Yonghu yonghu);
    Integer queryId();
    List<Zuche> querySysl(String dbno);
    Zuche queryState(Integer id);

}
