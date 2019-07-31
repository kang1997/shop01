package com.aishang.controller;

import com.aishang.po.OrderItemExt;
import com.aishang.service.IOrderItemService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("evaluation")
public class EvaluationController {

    @Resource
    private IOrderItemService orderItemService;

    /**
     * 我的评价,查询OrderItemExt，返回封装到myEvaluation.jsp视图界面
     * @param itemid
     * @param model
     * @return
     */
    @RequestMapping("myEvaluation")
    public String myEvaluation(Integer oid,Integer itemid, Model model){
        System.out.println(oid+"++++++++++++"+itemid);
        OrderItemExt orderitemByItemid = orderItemService.findOrderitemByItemid(itemid);
        model.addAttribute("oid",oid);
        model.addAttribute("orderitemByItemid",orderitemByItemid);
        return "myEvaluation";
    }
}
