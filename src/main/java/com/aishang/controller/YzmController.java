package com.aishang.controller;

import cn.dsna.util.images.ValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/")
public class YzmController {

    @RequestMapping("yanzhengma")
    public void getCode(HttpServletResponse response,HttpSession session) throws IOException {
        ValidateCode vc = new ValidateCode(163,64,4,100);
        String code = vc.getCode();
        session.setAttribute("sessioncode",code);
        vc.write(response.getOutputStream());
    }
    @RequestMapping("sessioncode")
    public void getsessionCode(HttpServletResponse response,HttpSession session) throws IOException {
        Object sessioncode1 = session.getAttribute("sessioncode");
        if(sessioncode1!=null){
            String sessioncode = session.getAttribute("sessioncode").toString();
            response.getWriter().print(sessioncode);
        }

    }
}
