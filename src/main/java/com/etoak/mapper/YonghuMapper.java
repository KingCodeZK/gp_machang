package com.etoak.mapper;

import com.etoak.bean.Yonghu;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zk on 2018/11/10.
 */
@Repository
public interface YonghuMapper {
    int add(Yonghu yonghu);
    List<Yonghu> selectPage();
    int update(Yonghu yonghu);
    int delete(String id);
    Yonghu checkByName(String name);
    int updateCanyu(Yonghu yonghu);

}
