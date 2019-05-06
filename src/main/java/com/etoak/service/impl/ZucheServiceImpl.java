package com.etoak.service.impl;

import com.etoak.bean.Dcxx;
import com.etoak.bean.Yonghu;
import com.etoak.bean.Zuche;
import com.etoak.mapper.DcxxMapper;
import com.etoak.mapper.ZucheMapper;
import com.etoak.service.ZucheService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zk on 2018/11/11.
 */
@Service
public class ZucheServiceImpl implements ZucheService{
    @Autowired
    private ZucheMapper zucheMapper;
    @Autowired
    private DcxxMapper dcxxMapper;

    @Override
    public Map<String, Object> query(Integer pageNumber, Integer pageSize, Yonghu yonghu) {
        PageHelper.startPage(pageNumber,pageSize);
        List<Yonghu> list = zucheMapper.query(yonghu);
        PageInfo<Yonghu> pi = new PageInfo<>(list);

        Map<String,Object> result = new HashMap<>();
        result.put("rows",list);
        result.put("total",pi.getTotal());
        return result;
    }

    @Override
    public Zuche findZucheByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int add(Zuche zuche) {

        List<Zuche> list = zucheMapper.querySysl(zuche.getDbno());
        if (list.size()>0){
            Zuche zu =list.get(0);
            if (zu.getSysl()<=0){
                throw new  RuntimeException("单车数量为零，请选择其他车型");
            }
        }
        int zifu = zucheMapper.queryId()+1;
        String no =zifu+"";
        while (no.length()<4){
            no="0"+no;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        zuche.setZlid("BICYCLE"+sdf.format(new Date())+no);
        Dcxx d = dcxxMapper.findDcxxBno(zuche.getDbno());
        //单车数量减一
        d.setSysl(d.getSysl()-1);
        dcxxMapper.updateSyslJia(d);
        zucheMapper.add(zuche);
        List<Zuche> l = zucheMapper.querySysl(zuche.getDbno());
        Zuche z= l.get(0);

        return z.getSysl();
    }

    @Override
    public int doRemove(List<Integer> ids) {
        return 0;
    }

    @Override
    public void doUpdate(String id) {
        Yonghu yonghu = new Yonghu();
        yonghu.setId(id);
        zucheMapper.update(yonghu);
    }

    @Override
    public Zuche querySysl(String dbno) {
        List<Zuche> list = zucheMapper.querySysl(dbno);
        return list.get(0);
    }
}
