package com.etoak.mapper;

import com.etoak.bean.Kaifatype;
import com.etoak.bean.Xiaoxi;
import com.etoak.bean.Xuqiu;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by zk on 2018/11/10.
 */
@Repository
public interface XuqiuMapper {
    int add(Xuqiu xuqiu);
    List<Xuqiu> selectPage();
    int update(Xuqiu xuqiu);
    int delete(Integer id);
    List<Xuqiu> query(Xuqiu xuqiu);
    Xuqiu queryInfoById(Xuqiu xuqiu);
    List<Kaifatype> queryAllType();
    int updateCanyu(Xuqiu xuqiu);
    int updateXiaoxi(Xuqiu xuqiu);
    int addXiaoxi(Xiaoxi xiaoxi);
    List<Xiaoxi> queryXiaoxi(Xiaoxi xiaoxi);

}
