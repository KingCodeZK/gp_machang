package com.etoak.service.impl;

import com.etoak.bean.Dcxx;
import com.etoak.bean.Xuqiu;
import com.etoak.mapper.DcxxMapper;
import com.etoak.mapper.ZucheMapper;
import com.etoak.service.DcxxService;
import com.etoak.utils.TreeNode;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by zk on 2018/11/11.
 */
@Service
public class DcxxServiceImpl implements DcxxService{
    @Autowired
    private DcxxMapper dcxxMapper;
    @Autowired
    private ZucheMapper zucheMapper;

    @Override
    public Map<String, Object> query(Integer pageNumber, Integer pageSize, Xuqiu xuqiu) {
        PageHelper.startPage(pageNumber,pageSize);
        List<Xuqiu> list = dcxxMapper.query(xuqiu);
        PageInfo<Xuqiu> pi = new PageInfo<>(list);

        Map<String,Object> result = new HashMap<>();
        result.put("rows",list);
        result.put("total",pi.getTotal());
        return result;

    }

    @Override
    public Dcxx findDcxxByPrimaryKey(Integer id) {
        return dcxxMapper.findEmpByPrimaryKey(id);
    }

    @Override
    public int add(Dcxx dcxx) {
        Dcxx d = dcxxMapper.getBXH(dcxx.getGys());
        if (d!=null){
            if (dcxx.getBxh().equals(d.getBxh()))
            throw new RuntimeException(d.getGys()+"下存在"+d.getBxh());
        }
        dcxx.setBno();
        return dcxxMapper.add(dcxx);
    }

    @Override
    public Dcxx getBXH(String gys) {
        return dcxxMapper.getBXH(gys);
    }

    @Override
    public int doRemove(List<String> ids) {
        if(ids!=null&&ids.size()>0){
            return dcxxMapper.remove(ids);
        }
        return 0;
    }

    @Override
    public void doUpdate(Dcxx dcxx) {
        Dcxx d = dcxxMapper.getBXH(dcxx.getGys());
        if(d!=null){
            if (dcxx.getBxh().equals(dcxx.getBxh())){
                throw new RuntimeException(d.getGys()+"已存在"+d.getBxh());
            }
        }
        int result = dcxxMapper.update(dcxx);
        if(result<=0){
            throw new RuntimeException("车辆"+dcxx.getBxh()+"失败！");
        }
    }

    @Override
    public List<TreeNode> findDcxxByPid(Integer id) {
        //定义空LIst集合
        List<TreeNode> trees = Collections.EMPTY_LIST;
        List<Dcxx> list = dcxxMapper.findDcxxByPid(id);
        if(list!=null&&list.size()>0){
            trees = new ArrayList<>();
            TreeNode tree = null;
            for(Dcxx dcxx:list){
                tree = new TreeNode();
                tree.setId(dcxx.getId());
                tree.setText(dcxx.getBxh());
                //判断当前节点下有没有子节点
                List<Dcxx> count = dcxxMapper.findDcxxByPid(dcxx.getId());
                tree.setState(count==null||count.size()==0?"open":"closed");
                trees.add(tree);
                System.out.println("chenggong!");
            }
        }
        return trees;
    }
}
