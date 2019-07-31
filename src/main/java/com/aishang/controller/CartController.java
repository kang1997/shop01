package com.aishang.controller;

import com.aishang.po.Cart;
import com.aishang.po.CartItem;
import com.aishang.po.Product;
import com.aishang.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.function.DoubleToLongFunction;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Resource
    private IProductService productService;

    /**
     * 添加购物车
     * @param pid
     * @param count
     * @param session
     * @param response
     * @throws IOException
     */
    @RequestMapping("addCart")
    public String  addCart(Integer pid, Double count, HttpSession session, HttpServletResponse response,String inPurchase) throws IOException {
        //System.out.println(count+"++++++++++"+pid);
        Product product = productService.findProductByPid(pid);
        CartItem cartItem = new CartItem();
        cartItem.setItemCount(count);
        cartItem.setProduct(product);
        Object sessionCart = session.getAttribute("cart");
        if (sessionCart == null) {
            Cart newCart = new Cart();
            session.setAttribute("cart", newCart);
        }
        ((Cart)session.getAttribute("cart")).addItem(cartItem);
        if(inPurchase!=null){
            return "redirect:/cart/listCart.do";
        }
        response.getWriter().print("ok");
        return null;
    }

    @RequestMapping("inPurchaseAddCart")
    public String  inPurchaseAddCart(String pid, String count, HttpSession session,String inPurchase) {
        Object sessionCart = session.getAttribute("cart");
        if (sessionCart == null) {
            Cart newCart = new Cart();
            session.setAttribute("cart", newCart);
        }
        String[] pids = pid.split(",");
        String[] nums = count.split(",");
        for(int i =0;i<pids.length;i++){
            Product product = productService.findProductByPid(Integer.parseInt(pids[i]));
            CartItem cartItem = new CartItem();
            cartItem.setItemCount(Double.parseDouble(nums[i]));
            cartItem.setProduct(product);
            ((Cart)session.getAttribute("cart")).addItem(cartItem);
        }
        return "redirect:/cart/listCart.do";

    }

    /**
     * 进入购物车界面
     * @return
     */
    @RequestMapping("listCart")
    public String listCart(){
        return "cart";
    }

    /**
     * 改变购物车购物项的数量
     * @param pid
     * @param count
     * @param session
     * @param response
     * @throws IOException
     */
    @RequestMapping("changeCountCart")
    public void changeCountCart(Integer pid, Double count, HttpSession session, HttpServletResponse response) throws IOException {
        Object sessionCart = session.getAttribute("cart");
        Double total = 0.0;
        if (sessionCart != null) {
            ((Cart)sessionCart).modifyItemCount(pid,count);
            total = ((Cart)sessionCart).getTotal();
        }
        response.getWriter().print(total);

    }

    /**
     * 删除购物项
     * @param pid
     * @param session
     * @param response
     * @throws IOException
     */
    @RequestMapping("deleteItem")
    public void deleteItem(Integer pid , HttpSession session, HttpServletResponse response) throws IOException {
        Object sessionCart = session.getAttribute("cart");
        Double total = 0.0;
        if (sessionCart != null) {
            ((Cart)sessionCart).deleteItem(pid);
            total = ((Cart)sessionCart).getTotal();
        }
        response.getWriter().print(total);

    }

    /**
     * 删除购物车的所有购物项
     * @param session
     * @param response
     * @throws IOException
     */
    @RequestMapping("deleteItemAll")
    public void deleteItemAll( HttpSession session, HttpServletResponse response) throws IOException {
        Object sessionCart = session.getAttribute("cart");
        if (sessionCart != null) {
            ((Cart)sessionCart).clearItems();
        }
        response.getWriter().print("ok");

    }

}
