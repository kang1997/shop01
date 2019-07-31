package com.aishang.service;

import com.aishang.po.CategoryExt2;
import com.aishang.po.PageBean;
import com.aishang.po.Product;
import com.aishang.po.ProductWapper;

import java.util.List;

public interface IProductService {

    /**
     * 根据二级分类csid查询这个类目的商品
     *
     * @param productWapper
     * @return
     */
    List<Product> findProductByCsid(ProductWapper productWapper);

    /**
     * 查找index页面的指定商品,调用二级分类csid查询这个类目的商品的方法；
     *
     * @return
     */
    List<CategoryExt2> findProductForIndex();

    /**
     * 根据cid/csid查询这个类目的商品的方法，一页商品数；并封装分页所需数据
     *
     * @param productWapper
     * @return
     */
 /*   PageBean<Product> findProductByCidOrCsidOrName(ProductWapper productWapper);*/

    /**
     * 搜索商品，根据名字进行模糊查询
     * 根据cid/csid查询这个类目的商品的方法，一页商品数；并封装分页所需数据
     * @param productWapper
     * @return
     */
    PageBean<Product> findProductByCidOrCsidOrName(ProductWapper productWapper);

    /**
     * 根据pid查询商品详情
     *
     * @param pid
     * @return
     */
    Product findProductByPid(Integer pid);
}
