package com.aishang.dao;

import com.aishang.po.Category;
import com.aishang.po.CategoryExt2;

import java.util.List;

public interface ICategoryDao {

    /**
     * 获取所有一级分类信息（并包括所属二级分类信息）。
     * @return
     */
    List<CategoryExt2> getAllCategory();

    /**
     * index页面获取所有需要热门，呈现商品的一级分类，以及二级分类// productList获取所有需要呈现热门商品的一级分类，以及二级分类
     * @return
     */
    List<CategoryExt2> getSuitableCategory();

    /**
     * productList获取所有需要呈现热门商品的二级分类
     * @return
     */
    List<CategoryExt2> getSuitableCategorySecond();

}
