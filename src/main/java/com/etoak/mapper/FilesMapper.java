package com.etoak.mapper;

import com.etoak.bean.Files;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zk on 2018/11/10.
 */
@Repository
public interface FilesMapper {
    int add(Files files);
    List<Files> selectPage();
    int update(Files files);
    int delete(Integer id);

}
