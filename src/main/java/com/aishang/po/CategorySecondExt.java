package com.aishang.po;

import java.util.List;

public class CategorySecondExt extends CategorySecond {
    private List<Product> productList;

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }
}
