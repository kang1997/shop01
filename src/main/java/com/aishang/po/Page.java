package com.aishang.po;

import java.util.List;

public class Page {
    private Integer nowPage;//当前页
    private Integer nowGroup;//当前组号
    private Integer preGroupForPage;//前面一组的最后一页码
    private Integer nextGroupForPage;//后面一组的第一个页码
    private Integer groupSize; //一组多少页
    private Integer totalPage; //最后的页码
    private List<Integer> pages; //当前这一组页码的集合

    public Integer getNowPage() {
        return nowPage;
    }

    public void setNowPage(Integer nowPage) {
        this.nowPage = nowPage;
    }

    public Integer getNowGroup() {
        return nowGroup;
    }

    public void setNowGroup(Integer nowGroup) {
        this.nowGroup = nowGroup;
    }

    public Integer getPreGroupForPage() {
        return preGroupForPage;
    }

    public void setPreGroupForPage(Integer preGroupForPage) {
        this.preGroupForPage = preGroupForPage;
    }

    public Integer getNextGroupForPage() {
        return nextGroupForPage;
    }

    public void setNextGroupForPage(Integer nextGroupForPage) {
        this.nextGroupForPage = nextGroupForPage;
    }

    public Integer getGroupSize() {
        return groupSize;
    }

    public void setGroupSize(Integer groupSize) {
        this.groupSize = groupSize;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<Integer> getPages() {
        return pages;
    }

    public void setPages(List<Integer> pages) {
        this.pages = pages;
    }
}
