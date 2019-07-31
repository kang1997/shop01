package com.aishang.service.impl;

import com.aishang.dao.ICategoryDao;
import com.aishang.dao.IProductDao;
import com.aishang.po.*;
import com.aishang.service.IProductService;
import com.aishang.util.GetPageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ProductServiceImpl implements IProductService {

    @Resource
    private IProductDao productdao;
    @Resource
    private ICategoryDao categoryDao;

    /**
     * 根据二级分类csid查询这个类目的商品,返回productList，productSearch,productDetails页面的热门商品
     *
     * @param productWapper
     * @return
     */
    @Override
    public List<Product> findProductByCsid(ProductWapper productWapper) {
        Integer[] ss = new Integer[50];
        List<Product> productByCsid = null;
        int j = 0;
        if (productWapper.getCsid() == null) {
            List<CategoryExt2> suitableCategory = categoryDao.getSuitableCategory();
            for (CategoryExt2 cg : suitableCategory) {
                for (CategorySecondExt cs : cg.getcSecExtList()) {
                    if (cs.getCsid() == null) {
                        break;
                    } else {
                        ss[j] = cs.getCsid();
                    }
                    j++;
                }
            }
            System.out.println(j);
            int index = j;
            while (index >= j) {
                index = (int) Math.round(Math.random() * j);
            }
            productByCsid = productdao.findProductByCsid(ss[index]);
            return productByCsid;
        } else {
            List<CategoryExt2> suitableCategorySecond = categoryDao.getSuitableCategorySecond();
            for (CategoryExt2 cg : suitableCategorySecond) {
                for (CategorySecondExt cs : cg.getcSecExtList()) {
                    if (cs.getCsid() == null) {
                        break;
                    } else {
                        ss[j] = cs.getCsid();
                    }
                    j++;
                }
            }
        }
        int index = j;
        while (index >= j) {
            index = (int) Math.round(Math.random() * j);
        }
        productByCsid = productdao.findProductByCsid(ss[index]);

        return productByCsid;
    }

    /**
     * 查找index页面的指定商品,-->调用二级分类csid查询这个类目的商品的方法；
     *
     * @return
     */
    @Override
    public List<CategoryExt2> findProductForIndex() {
        List<CategoryExt2> suitableCategory = categoryDao.getSuitableCategory();
        List<CategoryExt2> categoryExt2Lists = new ArrayList<CategoryExt2>();
        //遍历lists,取出数据，填充categoryExt2Lists
        //封装数据，一层套一层
        for (CategoryExt2 c : suitableCategory) {
            CategoryExt2 ce2 = new CategoryExt2();
            ce2.setCid(c.getCid());
            ce2.setOrder(c.getOrder());
            ce2.setCname(c.getCname());
            List<CategorySecondExt> cse2Lsit = new ArrayList<CategorySecondExt>();
            for (CategorySecondExt cs : c.getcSecExtList()) {
                CategorySecondExt cse2 = new CategorySecondExt();
                List<Product> productByCsid = productdao.findProductByCsid(cs.getCsid());
                cse2.setCsid(cs.getCsid());
                cse2.setCsname(cs.getCsname());
                cse2.setProductList(productByCsid);
                cse2Lsit.add(cse2);
            }
            ce2.setcSecExtList(cse2Lsit);
            categoryExt2Lists.add(ce2);
        }


        return categoryExt2Lists;
    }

    /**
     * 根据cid或csid查询这个类目的商品的方法，一页商品数；并封装分页所需数据
     * 搜索商品，根据名字进行模糊查询
     *
     * @param productWapper
     * @return
     */
    /*@Override
    public PageBean<Product> findProductByCidOrCsidOrName(ProductWapper productWapper) {
        PageBean<Product> pageBean = new PageBean<Product>();
        Integer pageSize = productWapper.getPageSize();
        pageBean.setPageSize(pageSize);
        Integer pageNow = productWapper.getPageNow();
        pageBean.setPageNow(pageNow);
        Integer startIndex = (pageNow - 1) * pageSize;
        productWapper.setStartIndex(startIndex);
        Integer productCountTotal = 0;
        List<Product> productSum = null;
        Integer totalPage;
        //每页的商品数量
        if (productWapper.getCsid() == null) {
            productSum = productdao.findProductByCidOrPname(productWapper);
            productCountTotal = productdao.findProductCountByCidOrPname(productWapper);
        } else {
            productSum = productdao.findProductByCsidOrPname(productWapper);
            productCountTotal = productdao.findProductCountByCsidOrPname(productWapper);
        }
        pageBean.setLists(productSum);
        pageBean.setTotal(productCountTotal);
        if (productCountTotal % pageSize == 0) {
            totalPage = productCountTotal / pageSize;
        } else {
            totalPage = productCountTotal / pageSize + 1;
        }
        pageBean.setTotalPage(totalPage);
        pageBean.setPage(GetPageInfo.pageHelper.getPageInfo(pageNow, pageBean.getTotalPage()));
        return pageBean;
    }*/


    /**
     * 搜索商品，根据名字进行模糊查询
     * 根据cid或csid查询这个类目的商品的方法，一页商品数；并封装分页所需数据
     *
     * @param productWapper
     * @return
     */
    @Override
    public PageBean<Product> findProductByCidOrCsidOrName(ProductWapper productWapper) {
        PageBean<Product> pageBean = new PageBean<Product>();
        Integer pageSize = productWapper.getPageSize();
        pageBean.setPageSize(pageSize);
        Integer productCountTotal = 0;
        List<Product> productSum = null;
        Integer totalPage;
        if (productWapper.getCsid() == null) {
            //商品总数
            productCountTotal = productdao.findProductCountByCidOrPname(productWapper);
        } else {
            //商品总数
            productCountTotal = productdao.findProductCountByCsidOrPname(productWapper);
        }
        pageBean.setTotal(productCountTotal);
        if (productCountTotal % pageSize == 0) {
            totalPage = productCountTotal / pageSize;
        } else {
            totalPage = productCountTotal / pageSize + 1;
        }
        Integer pageNow = productWapper.getPageNow();
        if (pageNow > totalPage) {
            pageNow = totalPage;
        }
        if(pageNow<=0){
            pageNow = 1;
            totalPage = 1;
        }
        pageBean.setPageNow(pageNow);
        Integer startIndex = (pageNow - 1) * pageSize;
        productWapper.setStartIndex(startIndex);
        pageBean.setTotalPage(totalPage);
        if (productWapper.getCsid() == null) {
            //每页的商品数量,根据cid,pname查
            productSum = productdao.findProductByCidOrPname(productWapper);
        } else {
            //每页的商品数量,根据csid,pname查
            productSum = productdao.findProductByCsidOrPname(productWapper);
        }
        pageBean.setLists(productSum);
        pageBean.setPage(GetPageInfo.pageHelper.getPageInfo(pageNow, pageBean.getTotalPage()));
        return pageBean;
    }

    /**
     * 根据pid查询商品详情
     *
     * @param pid
     * @return
     */
    @Override
    public Product findProductByPid(Integer pid) {
        return productdao.findProductByPid(pid);
    }
}
