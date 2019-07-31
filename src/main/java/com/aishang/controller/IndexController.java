package com.aishang.controller;

import com.aishang.po.CategoryExt;
import com.aishang.po.CategoryExt2;
import com.aishang.po.CategorySecondExt;
import com.aishang.po.Product;
import com.aishang.service.ICategoryService;
import com.aishang.service.IProductService;
import com.aishang.util.GetallCategoryExtUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/")
public class IndexController {

    @Resource
    private ICategoryService categoryService;
    @Resource
    private IProductService productService;
    /**
     *商城主页，获取所有一级分类以及相关联的二级分类的信息
     * @param model
     * @return
     */
    @RequestMapping("index")
    public String shangchengshuye(Model model, HttpServletRequest request){
       /* for (CategoryExt s : allCategory){
            System.out.println(s.getCname());
            System.out.println("++++++++++++++++++++++++++++++++++++++++++");
            for (CategorySecond z :s.getLists()){
                System.out.println(z.getCsname());
            }
        }*/

        /**
         * 在缓存中没有一级，二级类目，商品，就从数据库中取，再放入缓存
         */
        List<CategoryExt2> allCategory = GetallCategoryExtUtil.getallCategory(request);
         //List<CategoryExt2> allCategory = (List<CategoryExt2>) request.getServletContext().getAttribute("allCategory");
        /**
         * 获取所需的一级，二级，三级数据
         */
        List<CategoryExt2> categoryExt2 = productService.findProductForIndex();
  /*      for (CategoryExt2 ff:categoryExt2){
            for(CategorySecondExt tt :ff.getcSecExtList()){
                for(Product rr  : tt.getProductList()){
                    System.out.println(rr.getPname()+"55555555555");
                }
            }
        }*/
        model.addAttribute("categoryExt2",categoryExt2);

        /*    for (CategoryExt2 c:productForIndex){
                System.out.println(c.getCname());
                System.out.println("------------------------------------");
                for(CategorySecondExt cs:c.getListSecExt()){
                    System.out.println(cs.getCsid()+"."+cs.getCsname());
                    for(Product p :cs.getProductList()){
                        System.out.println(p.getPname());
                    }
                }
                System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

        }*/
        return "index";
    }
}
