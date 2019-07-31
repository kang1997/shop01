package com.aishang.service.impl;

import com.aishang.dao.IOrderItemDao;
import com.aishang.dao.IOrdersDao;
import com.aishang.po.*;
import com.aishang.service.IOrdersService;
import com.aishang.util.GetPageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class OrdersServiceImpl implements IOrdersService {

    @Resource
    private IOrdersDao ordersDao;
    @Resource
    private IOrderItemDao orderItemDao;
    /**
     * 添加订单,添加订单项，并返回oid;
     * @param cart
     * @return
     */
    @Override
    public Integer addOrders(Cart cart,Integer uid) {
        Orders orders = new Orders();
        orders.setTotal(cart.getTotal());
        orders.setOrdertime(new Date());
        orders.setState(0);
        orders.setUid(uid);
        ordersDao.addOrders(orders);
        Integer oid = orders.getOid();
        //System.out.println(oid+"////////////////////////////////////////");
        for (CartItem cartItem:cart.getCartItemsList()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setCount(cartItem.getItemCount());
            orderItem.setOid(oid);
            orderItem.setPid(cartItem.getProduct().getPid());
            orderItem.setSubtotal(cartItem.getSubTotal());
            orderItemDao.addOrderItem(orderItem);
        }
        return oid;
    }

    /**
     * 将添加的订单，填写地址，姓名，电话
     * @param orders
     */
    @Override
    public void updateOrders(Orders orders) {
        ordersDao.updateOrders(orders);
    }

    /**
     * 将生成的订单填写地址，姓名，电话之后，进入支付成功界面前改state状态，清空购物车之后进入支付成功界面
     * @param orders
     */
    @Override
    public void updateOrdersState(Orders orders) {
        ordersDao.updateOrdersState(orders);
    }

    /**
     * 确认订单页所购买商品的需要数据,包括订单，订单项和商品
     * @param oid
     * @return
     */
    @Override
    public OrdersExt findOrderByOid(Integer oid) {
        return ordersDao.findOrderByOid(oid);
    }

    /**
     * 查找我的订单，封装成pagebean
     * @param ordersWapper
     * @return
     */
    public PageBean<OrdersExt> findOrderAll(OrdersWapper ordersWapper){
        PageBean<OrdersExt> pageBean = new PageBean<OrdersExt>();
        List<OrdersExt> ordersExtList = new ArrayList<OrdersExt>();
       Integer total =  ordersDao.findOrderCount(ordersWapper);
        //System.out.println(total+"+++++++++++++++++++++++++++++");
       pageBean.setTotal(total);
        Integer pageSize = ordersWapper.getPageSize();
        Integer totalPage = null;
        pageBean.setPageSize(pageSize);
        if (total % pageSize == 0) {
            totalPage = total / pageSize;
        } else {
            totalPage = total / pageSize + 1;
        }
        pageBean.setTotalPage(totalPage);
        Integer pageNow = ordersWapper.getPageNow();
        if (pageNow > totalPage) {
            pageNow = totalPage;
        }
        if(pageNow<=0){
            pageNow = 1;
        }
        pageBean.setPageNow(pageNow);
        Integer startIndex = (pageNow - 1) * pageSize;
        ordersWapper.setStartIndex(startIndex);
       List<Orders> orders = ordersDao.findOrder(ordersWapper);
       for(Orders order :orders){
           OrdersExt ordersExt =  ordersDao.findOrderByOid(order.getOid());
           ordersExtList.add(ordersExt);
       }
       pageBean.setLists(ordersExtList);
       // System.out.println(pageNow+"''''''''''''''''''''''"+ pageBean.getTotalPage());
       pageBean.setPage(GetPageInfo.getPageInfo(pageNow, pageBean.getTotalPage()));

        return pageBean;
    }

    /**
     * 删除我的订单的记录
     * @param oid
     */
    @Override
    public void deleteOrder(Integer oid) {
        ordersDao.deleteOrder(oid);
    }

}
