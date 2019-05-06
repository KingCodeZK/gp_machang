package com.etoak.bean;

/**
 * Created by 18053 on 2019/4/24.
 */
public class Kaifatype {
    private Integer id;
    private String bh;
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBh() {
        return bh;
    }

    public void setBh(String bh) {
        this.bh = bh;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Kaifatype{" +
                "id=" + id +
                ", bh='" + bh + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
