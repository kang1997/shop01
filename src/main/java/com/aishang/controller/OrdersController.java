package com.aishang.controller;

import com.aishang.po.*;
import com.aishang.service.IOrderItemService;
import com.aishang.service.IOrdersService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Resource
    private IOrdersService ordersService;

    @Resource
    private IOrderItemService orderItemService;

    /**
     * 确认订单页面，判断用户登录与否，登录后写orders表和orderItem表，-》在转发到的订单的方法中
     * @param session
     * @return
     */
    @RequestMapping("addOrders")
    public String addOrders(HttpSession session,HttpServletRequest request) {
        //判断有没有session有没有登录，没有的话去登陆
        //登录后写orders和orderItem表
        Object obj = session.getAttribute("loginUser");
        if (obj == null) {
            return "login";
        }
        User loginuser = (User)session.getAttribute("loginUser");
        Object cart = session.getAttribute("cart");

        if(cart==null){
            return "cart";
        }
        if(((Cart)cart).getSum()<=0){
            return "cart";
        }
        Integer oid = ordersService.addOrders(((Cart)session.getAttribute("cart")),loginuser.getUid());
        request.setAttribute("oid",oid);
        return "forward:/orders/findOrdersByOid.do";
    }

    /**
     * 确认订单页面，展现数据和填写地址信息等
     * @param request
     * @return
     */
    @RequestMapping("findOrdersByOid")
    public String  findOrdersByOid(HttpServletRequest request, Model model){
        Integer oid =  Integer.parseInt(request.getAttribute("oid").toString());
        OrdersExt orderByOid = ordersService.findOrderByOid(oid);
        model.addAttribute("orderByOid",orderByOid);
       /* System.out.println(orderByOid.getOid()+"total---"+orderByOid.getTotal());
        for (OrderItemExt o :orderByOid.getOrderItemExt()){
            System.out.println(o.getSubtotal());
            System.out.println(o.getProduct().getPname());
            System.out.println(o.getItemid());
            System.out.println(o.getCount());
            System.out.println("****************************************************************");
        }*/
        return "confirmationOfOrder";
    }

    /**
     * 我的订单，购买记录
     * @param ordersWapper
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("findOrdersAll")
    public String findOrdersAll(OrdersWapper ordersWapper,HttpSession session,Model model,String pageTYF){
        if(session.getAttribute("loginUser")==null){
            return "login";
        }
        if(ordersWapper.getPageNow()==null){
            ordersWapper.setPageNow(1);
        }
        ordersWapper.setPageSize(5);
        if(ordersWapper.getUid()==null&&session.getAttribute("loginUser")!=null){
            ordersWapper.setUid(((User)session.getAttribute("loginUser")).getUid());
        }
        PageBean<OrdersExt>  orderAll= ordersService.findOrderAll(ordersWapper);
        List<String> datetime = new ArrayList<String>();
         for(OrdersExt oo: orderAll.getLists()){
             SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
             String dat=sdf.format(oo.getOrdertime());
             datetime.add(dat);
        }
        model.addAttribute("datetime",datetime);
        if(pageTYF!=null&&!"".equals(pageTYF)){
            model.addAttribute("pageTYF", ordersWapper.getPageNow());
        }
        model.addAttribute("orderAll",orderAll);
        return "myOrders";
    }

    @RequestMapping("deleteOrder")
    public void deleteOrder(String order, String orderItem, HttpServletResponse response) throws IOException {
 //       System.out.println(order+"*******************************"+orderItem);
        Integer oid = Integer.parseInt(order);
        String[] split = orderItem.split(",");
        for(String itmeid :split){
            Integer itid = Integer.parseInt(itmeid);
            orderItemService.deleteOrderItem(itid);
        }
        ordersService.deleteOrder(oid);
        response.getWriter().print("ok");
    }


}
