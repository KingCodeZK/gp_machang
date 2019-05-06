package com.etoak.service.impl;

import com.etoak.bean.Kaifatype;
import com.etoak.bean.Xiaoxi;
import com.etoak.bean.Xuqiu;
import com.etoak.mapper.XuqiuMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zk on 2018/11/10.
 */
@Service
public class XuqiuServiceImpl implements com.etoak.service.XuqiuService{
    @Autowired
    private XuqiuMapper xuqiuMapper;
    @Override
    public void add(Xuqiu xuqiu) {
        Xiaoxi xiaoxi = new Xiaoxi();
        xiaoxi.setXuqiuid(xuqiu.getId());
        xiaoxi.setTime(new Date());
        xiaoxi.setTitle("创建"+xuqiu.getName());
        xiaoxi.setContent("需求者"+xuqiu.getLianxiname()+"招募开发者中......");
        xuqiuMapper.addXiaoxi(xiaoxi);
        int result = xuqiuMapper.add(xuqiu);
        if (result<=0){
            throw new RuntimeException("新增"+xuqiu.getName()+"失败！");
        }

    }

    @Override
    public Map<String, Object> query(Integer pageNumber, Integer pageSize, Xuqiu xuqiu) {
        PageHelper.startPage(pageNumber,pageSize);
        List<Xuqiu> list = xuqiuMapper.query(xuqiu);
        PageInfo<Xuqiu> pi = new PageInfo<>(list);

        Map<String,Object> result = new HashMap<>();
        result.put("rows",list);
        result.put("total",pi.getTotal());
        result.put("first",pi.getNavigateFirstPage());
        result.put("pre",pi.getPrePage());
        result.put("next",pi.getNextPage());
        result.put("end",pi.getNavigateLastPage());
        return result;
    }

    @Override
    public Xuqiu queryInfoById(Xuqiu xuqiu) {
        Xuqiu newxuqiu = xuqiuMapper.queryInfoById(xuqiu);
        return newxuqiu;
    }

    @Override
    public void update(Xuqiu xuqiu) {
        int result = xuqiuMapper.update(xuqiu);
        if (result<=0){
            throw new RuntimeException("编辑"+xuqiu.getName()+"失败！");
        }
    }

    @Override
    public Map<String, Object> queryAllType() {
        List<Kaifatype> list = xuqiuMapper.queryAllType();
        Map<String,Object> result = new HashMap<>();
        result.put("type",list);
        return result;
    }

    @Override
    public void updateCanyu(Xuqiu xuqiu) {
        Xiaoxi xiaoxi = new Xiaoxi();
        xiaoxi.setXuqiuid(xuqiu.getId());
        xiaoxi.setTime(new Date());
        xiaoxi.setTitle("项目进行中");
        xiaoxi.setContent("项目在开发者手中准备开发。。");
        xuqiuMapper.addXiaoxi(xiaoxi);
        int result = xuqiuMapper.updateCanyu(xuqiu);
        if (result<=0){
            throw  new RuntimeException("参与项目失败！");
        }
    }

    @Override
    public void updateXuqiu(Xuqiu xuqiu) {
        int result = xuqiuMapper.updateXiaoxi(xuqiu);
        if (result<=0){
            throw  new RuntimeException("参与项目失败！");
        }


    }

    @Override
    public void addXiaoxi(Xiaoxi xiaoxi) {
        int result = xuqiuMapper.addXiaoxi(xiaoxi);
        if (result<=0){
            throw new RuntimeException("新增"+xiaoxi.getTitle()+"消息失败！");
        }

    }

    @Override
    public Map<String, Object> queryXiaoxi(Xiaoxi xiaoxi) {
        List<Xiaoxi> list = xuqiuMapper.queryXiaoxi(xiaoxi);
        Map<String,Object> result = new HashMap<>();
        result.put("data",list);
        return result;
    }


}
