package com.aishang.service;

import com.aishang.po.CategoryExt;
import com.aishang.po.CategoryExt2;

import java.util.List;

public interface ICategoryService {

    /**
     * 获取所有一级分类信息，并包括所属二级分类信息
     * @return
     */
     List<CategoryExt2> getAllCategory();

}
