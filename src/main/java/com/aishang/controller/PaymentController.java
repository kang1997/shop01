package com.aishang.controller;

import com.aishang.po.Orders;
import com.aishang.po.OrdersExt;
import com.aishang.service.IOrdersService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;

@Controller
@RequestMapping("/payment")
public class PaymentController {

    @Resource
    private IOrdersService ordersService;

    /**
     * 到支付界面保存姓名，地址，电话，然后转发到支付界面
     * @param orders
     * @param model
     * @return
     */
    @RequestMapping("paymentInterface")
    public String paymentInterface(Orders orders, Model model) {
        ordersService.updateOrders(orders);
        model.addAttribute("orders",orders);
        return "paymentInterface";
    }

    /**
     * 将生成的订单填写地址，姓名，电话之后，进入支付成功界面前改state状态，清空购物车之后进入支付成功界面
     * @param orders
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("successfulPayment")
    public String successfulPayment(Orders orders, HttpSession session,Model model,String orderDetails){
        if(orderDetails==null){
            orders.setState(1);
            ordersService.updateOrdersState(orders);
        }
        session.removeAttribute("cart");
        OrdersExt orderByOid = ordersService.findOrderByOid(orders.getOid());
        model.addAttribute("orderByOid",orderByOid);
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dat=sdf.format(orderByOid.getOrdertime());
        model.addAttribute("dat",dat);
        return "successfulPayment";
    }


}
