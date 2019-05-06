package com.etoak.service.impl;

import com.etoak.bean.Files;
import com.etoak.mapper.FilesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by zk on 2018/11/10.
 */
@Service
public class FilesServiceImpl implements com.etoak.service.FilesService{
    @Autowired
    private FilesMapper filesMapper;
    @Override
    public void add(Files files) {
        int result = filesMapper.add(files);
        if (result<=0){
            throw new RuntimeException("新增"+files.getFilename()+"失败！");
        }

    }
}
