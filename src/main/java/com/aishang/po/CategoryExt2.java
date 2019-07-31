package com.aishang.po;

import java.util.List;

public class CategoryExt2 extends Category {
    private List<CategorySecondExt> cSecExtList;

    public List<CategorySecondExt> getcSecExtList() {
        return cSecExtList;
    }

    public void setcSecExtList(List<CategorySecondExt> cSecExtList) {
        this.cSecExtList = cSecExtList;
    }
}
