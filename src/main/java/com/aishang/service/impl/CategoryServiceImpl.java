package com.aishang.service.impl;

import com.aishang.dao.ICategoryDao;
import com.aishang.po.CategoryExt;
import com.aishang.po.CategoryExt2;
import com.aishang.service.ICategoryService;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;

@Service("categoryservice")
@Transactional
public class CategoryServiceImpl implements ICategoryService {

    @Resource
    private ICategoryDao categoryDao;

    /**
     * 所有的一二级类目，主要为nav中提供数据
     * @return
     */
    @Override
    public List<CategoryExt2> getAllCategory() {
        return categoryDao.getAllCategory();
    }
}
