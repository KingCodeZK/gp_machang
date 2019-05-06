package com.etoak.bean;

import java.util.UUID;

/**
 * Created by zk on 2018/11/16.
 */
public class Dcxx {
    private Integer id;
    private String bno;
    private String bxh;
    private String gys;
    private String blb;
    private Integer sysl;
    private Integer pid;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBno() {
        return bno;
    }

    public void setBno() {
        bno = UUID.randomUUID().toString().replaceAll("-","");
    }

    public String getBxh() {
        return bxh;
    }

    public void setBxh(String bxh) {
        this.bxh = bxh;
    }

    public String getGys() {
        return gys;
    }

    public void setGys(String gys) {
        this.gys = gys;
    }

    public String getBlb() {
        return blb;
    }

    public void setBlb(String blb) {
        this.blb = blb;
    }

    public Integer getSysl() {
        return sysl;
    }

    public void setSysl(Integer sysl) {
        this.sysl = sysl;
    }
}
