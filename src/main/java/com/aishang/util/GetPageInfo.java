package com.aishang.util;

import com.aishang.po.Page;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

/**
 * spring工具类调用方式
 */
@Component
public class GetPageInfo {

    public static  GetPageInfo pageHelper;

    @PostConstruct
    public void init(){
        pageHelper = this;
    }

    public static Page getPageInfo(int nowPage,int totalPage){

        //假定当前一组显示6个页码
        int groupSize = 5;
        //计算当前的页的组
        int nowGroup = 0;
        if(nowPage%groupSize==0){
            nowGroup = nowPage/groupSize;
        }else{
            nowGroup = nowPage/groupSize+1;
        }
        //计算前面的组的最后一页的页码
        int PreGroupForPage = -1;
        if(nowGroup!=1){
            PreGroupForPage = (nowGroup-1)*groupSize;
        }
        //计算总共多少组
        int lastGroup = 0;//最后一组
        if(totalPage%groupSize==0){
            lastGroup = totalPage/groupSize;
        }else{
            lastGroup = totalPage/groupSize+1;
        }
        //计算后面的组的第一页的页码
        int nextGroupForPage = -1;
        if(nowGroup!=lastGroup){
            nextGroupForPage = nowGroup*groupSize+1;
        }
        //当前这一组页码的集合
        List<Integer> pages = new ArrayList<Integer>();
        //设置当前的这一组的页码
        int begin =(nowGroup-1)*groupSize + 1;
        int end;
        if(nowGroup!=lastGroup){
            end = nowGroup * groupSize;
        }else{
            end = totalPage;
        }
        //计算出这组首页和最后一页的页码后，加入到集合中
        for(int i = begin ;i<= end;i++){
            pages.add(i);
        }
        Page page = new Page();
        page.setGroupSize(groupSize);
        page.setNextGroupForPage(nextGroupForPage);
        page.setNowGroup(nowGroup);
        page.setNowPage(nowPage);
        page.setPages(pages);
        page.setPreGroupForPage(PreGroupForPage);
        page.setTotalPage(totalPage);
        return page;
    }
}
