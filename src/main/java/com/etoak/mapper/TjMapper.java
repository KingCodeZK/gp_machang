package com.etoak.mapper;

import com.etoak.bean.Yonghu;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zk on 2018/11/11.
 */
@Repository
public interface TjMapper {
    List<Yonghu> query();
}
