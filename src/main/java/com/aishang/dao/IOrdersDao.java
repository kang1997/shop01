package com.aishang.dao;


import com.aishang.po.Orders;
import com.aishang.po.OrdersExt;
import com.aishang.po.OrdersWapper;

import java.util.List;

public interface IOrdersDao {
    /**
     * 添加订单
     * @param orders
     * @return
     */
    void addOrders(Orders orders);

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
     * 确认订单页所购买商品的需要数据，包括订单，订单项和商品
     * @param oid
     * @return
     */
    OrdersExt findOrderByOid(Integer oid);

    /**
     * 查找我的订单数量
     * @return
     */
    Integer findOrderCount(OrdersWapper ordersWapper);

    /**
     * 遍历订单
     * @return
     */
     List<Orders> findOrder(OrdersWapper ordersWapper);

    /**
     * 删除我的订单的记录
     * @param oid
     */
     void deleteOrder(Integer oid);
}
