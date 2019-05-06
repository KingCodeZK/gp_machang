package com.etoak.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by 18053 on 2019/4/14.
 */
public class Xuqiu {
    private String id;
    private String name;
    private String kaifatype;
    private Integer qiwangzq;
    private Integer shijizq;
    private String jishu;
    private String jianshu;
    private String attachid;
    private Integer status;
    private Integer kafazheid;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date time;
    private Integer yusuan;
    private String xuqiuid;
    private Integer kaifazhetype;
    private Integer xiangmutype;
    private String cankao;
    private String lianxiname;
    private String youxiang;
    private String shouji;
    private String test1;
    private String test2;
    private String test3;
    private String test4;
    private String test5;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKaifatype() {
        return kaifatype;
    }

    public void setKaifatype(String kaifatype) {
        this.kaifatype = kaifatype;
    }

    public Integer getQiwangzq() {
        return qiwangzq;
    }

    public void setQiwangzq(Integer qiwangzq) {
        this.qiwangzq = qiwangzq;
    }

    public Integer getShijizq() {
        return shijizq;
    }

    public void setShijizq(Integer shijizq) {
        this.shijizq = shijizq;
    }

    public String getJishu() {
        return jishu;
    }

    public void setJishu(String jishu) {
        this.jishu = jishu;
    }

    public String getJianshu() {
        return jianshu;
    }

    public void setJianshu(String jianshu) {
        this.jianshu = jianshu;
    }

    public String getAttachid() {
        return attachid;
    }

    public void setAttachid(String attachid) {
        this.attachid = attachid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getKafazheid() {
        return kafazheid;
    }

    public void setKafazheid(Integer kafazheid) {
        this.kafazheid = kafazheid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getYusuan() {
        return yusuan;
    }

    public void setYusuan(Integer yusuan) {
        this.yusuan = yusuan;
    }

    public String getXuqiuid() {
        return xuqiuid;
    }

    public void setXuqiuid(String xuqiuid) {
        this.xuqiuid = xuqiuid;
    }

    public Integer getKaifazhetype() {
        return kaifazhetype;
    }

    public void setKaifazhetype(Integer kaifazhetype) {
        this.kaifazhetype = kaifazhetype;
    }

    public Integer getXiangmutype() {
        return xiangmutype;
    }

    public void setXiangmutype(Integer xiangmutype) {
        this.xiangmutype = xiangmutype;
    }

    public String getCankao() {
        return cankao;
    }

    public void setCankao(String cankao) {
        this.cankao = cankao;
    }

    public String getLianxiname() {
        return lianxiname;
    }

    public void setLianxiname(String lianxiname) {
        this.lianxiname = lianxiname;
    }

    public String getYouxiang() {
        return youxiang;
    }

    public void setYouxiang(String youxiang) {
        this.youxiang = youxiang;
    }

    public String getShouji() {
        return shouji;
    }

    public void setShouji(String shouji) {
        this.shouji = shouji;
    }

    public String getTest1() {
        return test1;
    }

    public void setTest1(String test1) {
        this.test1 = test1;
    }

    public String getTest2() {
        return test2;
    }

    public void setTest2(String test2) {
        this.test2 = test2;
    }

    public String getTest3() {
        return test3;
    }

    public void setTest3(String test3) {
        this.test3 = test3;
    }

    public String getTest4() {
        return test4;
    }

    public void setTest4(String test4) {
        this.test4 = test4;
    }

    public String getTest5() {
        return test5;
    }

    public void setTest5(String test5) {
        this.test5 = test5;
    }

    @Override
    public String toString() {
        return "Xuqiu{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", kaifatype='" + kaifatype + '\'' +
                ", qiwangzq=" + qiwangzq +
                ", shijizq=" + shijizq +
                ", jishu='" + jishu + '\'' +
                ", jianshu='" + jianshu + '\'' +
                ", attachid='" + attachid + '\'' +
                ", status=" + status +
                ", kafazheid=" + kafazheid +
                ", time=" + time +
                ", yusuan=" + yusuan +
                ", xuqiuid='" + xuqiuid + '\'' +
                ", kaifazhetype=" + kaifazhetype +
                ", xiangmutype=" + xiangmutype +
                ", cankao='" + cankao + '\'' +
                ", lianxiname='" + lianxiname + '\'' +
                ", youxiang='" + youxiang + '\'' +
                ", shouji='" + shouji + '\'' +
                ", test1='" + test1 + '\'' +
                ", test2='" + test2 + '\'' +
                ", test3='" + test3 + '\'' +
                ", test4='" + test4 + '\'' +
                ", test5='" + test5 + '\'' +
                '}';
    }
}
