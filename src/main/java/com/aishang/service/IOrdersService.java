package com.aishang.service;

import com.aishang.po.*;

import java.util.List;

public interface IOrdersService {

    /**
     * 添加订单
     * @param cart
     * @return
     */
    Integer addOrders(Cart cart,Integer uid);

    /**
     * 将添加的订单，填写地址，姓名，电话
     * @param orders
     */
    void updateOrders(Orders orders);

    /**
     * 将生成的订单填写地址，姓名，电话之后，进入支付成功界面前改state状态，清空购物车之后进入支付成功界面
     * @param orders
     */
    void updateOrdersState(Orders orders);

    /**
     * 确认订单页所购买商品的需要数据,包括订单，订单项和商品
     * @param oid
     * @return
     */
    OrdersExt findOrderByOid(Integer oid);

    /**
     * 查找我的订单，封装成pagebean
     * @param ordersWapper
     * @return
     */
    PageBean<OrdersExt> findOrderAll(OrdersWapper ordersWapper);

    /**
     * 删除我的订单的记录
     * @param oid
     */
    void deleteOrder(Integer oid);
}
