package com.aishang.dao;

import com.aishang.po.OrderItem;
import com.aishang.po.OrderItemExt;

public interface IOrderItemDao {
    /**
     * 添加订单项，注意oid;是由订单完成生成的oid
     * @param orderItem
     */
    void  addOrderItem(OrderItem orderItem);

    /**
     * 删除我的订单，先删除我的订单项的记录
     * @param itemid
     */
    void deleteOrderItem(Integer itemid);

    /**
     * 查询OrderItemExt，返回封装到myEvaluation.jsp视图界面
     * @param itemid
     * @return
     */
    OrderItemExt findOrderitemByItemid(Integer itemid);
}
