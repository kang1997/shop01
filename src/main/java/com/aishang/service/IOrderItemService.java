package com.aishang.service;

import com.aishang.po.OrderItemExt;

public interface IOrderItemService {

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
