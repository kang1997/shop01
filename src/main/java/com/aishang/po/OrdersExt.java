package com.aishang.po;

import java.util.List;

public class OrdersExt extends  Orders {

    private List<OrderItemExt> orderItemExt;

    public List<OrderItemExt> getOrderItemExt() {
        return orderItemExt;
    }

    public void setOrderItemExt(List<OrderItemExt> orderItemExt) {
        this.orderItemExt = orderItemExt;
    }
}
