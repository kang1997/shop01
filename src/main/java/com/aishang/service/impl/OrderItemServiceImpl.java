package com.aishang.service.impl;

import com.aishang.dao.IOrderItemDao;
import com.aishang.dao.IOrdersDao;
import com.aishang.po.OrderItemExt;
import com.aishang.service.IOrderItemService;
import com.aishang.service.IOrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;

@Service
@Transactional
public class OrderItemServiceImpl implements IOrderItemService {

    @Resource
    private IOrderItemDao orderItemDao;

    /**
     * 删除我的订单，先删除我的订单项的记录
     * @param itemid
     */
    @Override
    public void deleteOrderItem(Integer itemid) {
        orderItemDao.deleteOrderItem(itemid);
    }

    /**
     * 查询OrderItemExt，返回封装到myEvaluation.jsp视图界面
     * @param itemid
     * @return
     */
    @Override
    public OrderItemExt findOrderitemByItemid(Integer itemid) {
        return orderItemDao.findOrderitemByItemid(itemid);
    }
}
