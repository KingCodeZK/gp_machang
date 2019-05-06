package com.etoak.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by zk on 2018/11/16.
 */
public class Zuche {
    private Integer id;
    private String zlid;
    private String dbno;
    private String zlname;
    private String phone;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date startTime;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date endTime;
    private Integer state;
    private Integer count;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
    /*Dcxx*/

    private String bxh;
    private Integer sysl;

    public Integer getSysl() {
        return sysl;
    }

    public void setSysl(Integer sysl) {
        this.sysl = sysl;
    }

    public String getBxh() {
        return bxh;
    }

    public void setBxh(String bxh) {
        this.bxh = bxh;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getZlid() {
        return zlid;
    }

    public void setZlid(String zlid) {
        this.zlid = zlid;
    }

    public String getDbno() {
        return dbno;
    }

    public void setDbno(String dbno) {
        this.dbno = dbno;
    }

    public String getZlname() {
        return zlname;
    }

    public void setZlname(String zlname) {
        this.zlname = zlname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
