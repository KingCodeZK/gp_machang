package com.etoak.bean;

/**
 * Created by 18053 on 2019/4/16.
 */
public class Files {
    private Integer id;
    private String filename;
    private String path;
    private String xiangmuid;
    private Integer type;
    private String f1;
    private String f2;
    private String f3;
    private String f4;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getXiangmuid() {
        return xiangmuid;
    }

    public void setXiangmuid(String xiangmuid) {
        this.xiangmuid = xiangmuid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getF1() {
        return f1;
    }

    public void setF1(String f1) {
        this.f1 = f1;
    }

    public String getF2() {
        return f2;
    }

    public void setF2(String f2) {
        this.f2 = f2;
    }

    public String getF3() {
        return f3;
    }

    public void setF3(String f3) {
        this.f3 = f3;
    }

    public String getF4() {
        return f4;
    }

    public void setF4(String f4) {
        this.f4 = f4;
    }

    @Override
    public String toString() {
        return "Files{" +
                "id=" + id +
                ", filename='" + filename + '\'' +
                ", path='" + path + '\'' +
                ", xiangmuid='" + xiangmuid + '\'' +
                ", type=" + type +
                ", f1='" + f1 + '\'' +
                ", f2='" + f2 + '\'' +
                ", f3='" + f3 + '\'' +
                ", f4='" + f4 + '\'' +
                '}';
    }
}
