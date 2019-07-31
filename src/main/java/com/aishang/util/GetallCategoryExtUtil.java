package com.aishang.util;

import com.aishang.po.*;
import com.aishang.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Component
public class GetallCategoryExtUtil {

    @Resource
    private ICategoryService categoryService ;

    private static  GetallCategoryExtUtil categoryService2;

    @PostConstruct
    public void init(){
        categoryService2 = this;
        categoryService2.categoryService = this.categoryService;
    }

    /**
     * 在缓存中没有一级，二级类目，商品，就从数据库中取，再放入缓存
     * @param request
     */
    public static List<CategoryExt2> getallCategory(HttpServletRequest request){
        List<CategoryExt2> allCategory = null;
        if(request.getServletContext().getAttribute("allCategory")==null){
            allCategory = categoryService2.categoryService.getAllCategory();
            request.getServletContext().setAttribute("allCategory",allCategory);
            return allCategory;
        }else{
             return (List<CategoryExt2>)request.getServletContext().getAttribute("allCategory");
        }
          /*for (CategoryExt2 s : allCategory){
            System.out.println(s.getCname());
            System.out.println("++++++++++++++++++++++++++++++++++++++++++");
            for (CategorySecondExt z :s.getcSecExtList()){
                System.out.println(z.getCsname());
                if(z.getProductList()!=null){
                    System.out.println("5555555555555555555555555555555555555555555555555");
                }
                System.out.println("*******************"+z.getProductList()+"5555555555555");
                for(Product l :z.getProductList()){
                    System.out.println(l.getPname()+"*********************************************************");
                }
            }
        }*/
    }

}
