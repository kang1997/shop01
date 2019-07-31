package com.aishang.po;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 购物车
 */
public class Cart {
    //拥有一个购物项的集合（List Set Map）
    private Map<Integer,CartItem> mapCartItems = new LinkedHashMap<Integer,CartItem>();
    private Double total = 0.0 ;
    private Double sum = 0.0;

    public Cart(){
        this.total = 0.0;
        this.sum = 0.0;
    }
    /**
     * 添加购物车
     * @param item
     */
    public void addItem(CartItem item){
        Integer pid = item.getProduct().getPid();
        if(mapCartItems.containsKey(pid)){
            Double count = mapCartItems.get(pid).getItemCount()+item.getItemCount();
            mapCartItems.get(pid).setItemCount(count);
        }else{
            mapCartItems.put(pid,item);
        }
        this.total = this.total + item.getSubTotal();
       // System.out.println( item.getItemCount()+"*****************************");
        this.sum = this.sum + item.getItemCount();
    }

    /**
     * 删除某一购物项的方法
     * @param pid
     */
    public void deleteItem(Integer pid){
        CartItem removeItem = mapCartItems.remove(pid);
        this.total = this.total - removeItem.getSubTotal();
        this.sum = this.sum - removeItem.getItemCount();
    }

    /**
     * 修改某一个购物项数量的方法
     * @param pid
     * @param newCount
     */
    public void modifyItemCount(Integer pid, Double newCount){
        CartItem cartItem = mapCartItems.get(pid);
        this.total = this.total - cartItem.getSubTotal();
        this.sum = this.sum - cartItem.getItemCount();
        cartItem.setItemCount(newCount);
        this.total = this.total + cartItem.getSubTotal();
        this.sum = this.sum + cartItem.getItemCount();
    }

    /**
     * 清空购物车方法
     */
    public void clearItems(){
        mapCartItems.clear();
        this.total = 0.0;
        this.sum = 0.0;
    }

    /**
     * 商品总价
     * @return
     */
    public Double getTotal(){
        return this.total;
    }
    /**
     * 商品总数
     * @return
     */
    public Double getSum(){
        return this.sum;
    }

    /**
     * 遍历购物项
     * @return
     */
    public Collection<CartItem> getCartItemsList(){
        return this.mapCartItems.values();

    }


}
