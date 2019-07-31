package com.aishang.po;

import java.util.List;
//扩展类 Ext extend
public class CategoryExt extends Category{

    //拥有一个二级分类的集合1：N
    private List<CategorySecond> lists;

    public List<CategorySecond> getLists() {
        return lists;
    }

    public void setLists(List<CategorySecond> lists) {
        this.lists = lists;
    }
}
