package com.aishang.po;

/**
 * 购物车的每条信息,购物项
 */
public class CartItem {

    private Product product;//商品信息
    private Double itemCount;//商品数量

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Double getItemCount() {
        return itemCount;
    }

    public void setItemCount(Double itemCount) {
        this.itemCount = itemCount;
    }

    public Double getSubTotal() {
        return product.getShop_price() * this.itemCount;
    }
}
