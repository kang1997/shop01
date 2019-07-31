package com.aishang.po;

public class Category {
    private Integer cid;
    private String cname;
    private Integer orders;
    private Integer visable;

    public Integer getOrder() {
        return orders;
    }

    public void setOrder(Integer orders) {
        this.orders = orders;
    }

    public Integer getVisable() {
        return visable;
    }

    public void setVisable(Integer visable) {
        this.visable = visable;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}
