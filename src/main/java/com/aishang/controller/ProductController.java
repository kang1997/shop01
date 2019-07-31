package com.aishang.controller;

import com.aishang.po.*;
import com.aishang.service.ICategoryService;
import com.aishang.service.IProductService;
import com.aishang.util.GetallCategoryExtUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Resource
    private ICategoryService categoryService;
    @Resource
    private IProductService productService;

    /**
     * index主页到productlist列表的controller层
     *
     * @param model
     * @param request
     * @param productWapper
     * @return
     */
    @RequestMapping("productList")
    public String productListById(Model model, HttpServletRequest request, ProductWapper productWapper,String pageTYF) throws UnsupportedEncodingException {
        //在缓存中没有一级，二级类目，商品，就从数据库中取，再放入缓存
        List<CategoryExt2> allCategory = GetallCategoryExtUtil.getallCategory(request);
        if (productWapper.getCid() == null||"".equals(productWapper.getCid())) {
            productWapper.setCid(1);
        }
        //根据cid 找到cid的商品集合
        for (CategoryExt2 c : allCategory) {
            if (c.getCid() == productWapper.getCid()) {
                model.addAttribute("nowCategory", c);
                if (productWapper.getCsid() != null) {
                    for (CategorySecondExt cs : c.getcSecExtList()) {
                        if (cs.getCsid() == productWapper.getCsid()) {
                            model.addAttribute("nowCategorySecond", cs);
                            break;
                        }
                    }
                }
                break;
            }
        }
        if (productWapper.getPname() != null && !"".equals(productWapper.getPname())) {
            productWapper.setPname(new String(productWapper.getPname().getBytes("iso-8859-1"), "UTF-8"));
        }
        //获取当前分页所需的数据
        if (productWapper.getPageNow() == null) {
            productWapper.setPageNow(1);
        }
        productWapper.setPageSize(12);

        //productService.findProductByCid层会检查从index页面带来的csid,空就执行查找一级类目下的商品,否则查找二级类目下的商品
        //返回分页的数据
        PageBean<Product> productByCid = productService.findProductByCidOrCsidOrName(productWapper);
        //productList页面的热度商品
        List<Product> productByCsid = productService.findProductByCsid(productWapper);
        //跳页回显
        if(pageTYF!=null&&!"".equals(pageTYF)){
            model.addAttribute("pageTYF", productByCid.getPageNow());
        }
        model.addAttribute("productByCid", productByCid);
        model.addAttribute("productByCsid", productByCsid);
        model.addAttribute("productWapper", productWapper);
        return "productList";
    }

    /**
     * 搜索商品的controller层
     *
     * @param model
     * @param request
     * @param productWapper
     * @return
     */
    @RequestMapping("/productSearch.do")
    public String productSearch(Model model, HttpServletRequest request, ProductWapper productWapper,String pageTY) throws UnsupportedEncodingException {
        //在缓存中没有一级，二级类目，商品，就从数据库中取，再放入缓存
        List<CategoryExt2> allCategory = GetallCategoryExtUtil.getallCategory(request);
        //获取当前分页所需的数据
        if (productWapper.getPageNow() == null) {
            productWapper.setPageNow(1);
        }
        if (productWapper.getPname() != null && !"".equals(productWapper.getPname())) {
            productWapper.setPname(new String(productWapper.getPname().getBytes("iso-8859-1"), "UTF-8"));
        }

        productWapper.setPageSize(12);

        //productService.findProductByCid层会检查从index页面带来的csid,空就执行查找一级类目下的商品,否则查找二级类目下的商品
        //返回分页的数据
        PageBean<Product> productByCid = productService.findProductByCidOrCsidOrName(productWapper);
        //productList页面的热度商品
        List<Product> productByCsid = productService.findProductByCsid(productWapper);
        //跳页回显
        if(pageTY!=null&&!"".equals(pageTY)){
            model.addAttribute("pageTY", productByCid.getPageNow());
        }
        model.addAttribute("productByCid", productByCid);
        model.addAttribute("productByCsid", productByCsid);
        model.addAttribute("productWapper", productWapper);
        model.addAttribute("forms","forms");
        return "productSearch";
    }

    /**
     * 商品详情页
     *
     * @param pid
     * @param model
     * @return
     */
    @RequestMapping("productDetails")
    public String productDetails(Integer pid, Model model) {
        Product productByPid = productService.findProductByPid(pid);
        model.addAttribute("productByPid", productByPid);
        return "productDetails";
    }

}
