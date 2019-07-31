package com.aishang.dao;

import com.aishang.po.Product;
import com.aishang.po.ProductWapper;

import java.util.List;

public interface IProductDao {

    /**
     * 根据二级类目信息查询商品
     * @param csid
     * @return
     */
    List<Product> findProductByCsid(int csid);

    /**
     * 根据cid查询这个类目的商品的方法，一页商品数；
     * @param productWapper
     * @return
     */
    List<Product> findProductByCidOrPname(ProductWapper productWapper);

    /**
     * 根据cid查询这个类目的商品的方法，总商品数；
     * @param productWapper
     * @return
     */
    Integer findProductCountByCidOrPname(ProductWapper productWapper);

    /**
     * 根据csid查询这个类目的商品的方法，一页商品数；
     * @param productWapper
     * @return
     */
    List<Product> findProductByCsidOrPname(ProductWapper productWapper);

    /**
     * 根据csid查询这个类目的商品的方法，总商品数；||搜索商品，根据名字进行模糊查询;
     * @param productWapper
     * @return
     */
    Integer findProductCountByCsidOrPname(ProductWapper productWapper);

    /**
     * 根据PID，查询商品详情
     * @param pid
     * @return
     */
    Product findProductByPid(Integer pid);
}
