package com.aishang.controller;

import com.aishang.po.User;
import com.aishang.service.IUserService;
import com.aishang.util.GetallCategoryExtUtil;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;

    /**
     * 搭建框架测试controller层整合代码
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/showUser.do")
    public void selectUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text;html;charset=utf-8");
        long userId = Long.parseLong(request.getParameter("id"));
        User user = this.userService.selectUser(userId);
        response.getWriter().write(JSON.toJSONString(user));
        response.getWriter().close();
    }

    /**
     * 搭建框架测试controller层整合代码
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/springmvcDemo.do")
    public String springmvcDemo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "user";
    }

    //springmvc 中的方法返回值一般都是string

    /**
     * 跳转到注册页面
     * @return
     */
    @RequestMapping("/register.do")
    public String goRegister() {
        //form表单提交，可以一个表单多提交
        //经历了一次试图解析的过程，请求转发通过spring-mvc的xml的配置文件
        return "register";
    }

    /**
     * 利用前台ajax，查找用户名是否重复
     *
     * @param username
     * @param response
     * @return
     * @throws IOException
     * @author kln
     * @version 1.0
     */
    @RequestMapping("finduserbyname")
    public String goRegister(String username, HttpServletResponse response) throws IOException {
        /* String username = request.getParameter("username");*/
        if (username == null || "".equals(username)) {
            response.getWriter().print("null");
        } else {
            User user = userService.findUserByName(username);
            if (user != null) {
                response.getWriter().print("notok");
            } else {
                response.getWriter().print("ok");
            }

        }

        return null;
    }

    /**
     * 利用前台ajax，查找手机号是否重复
     *
     * @param phone
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/finduserbyphone.do")
    public String finduserbyphone(String phone, HttpServletResponse response) throws IOException {
        if (phone == null || "".equals(phone)) {
            response.getWriter().print("null");
        } else {
            User userByPhone = userService.findUserByPhone(phone);
            if (userByPhone != null) {
                response.getWriter().print("notok");
            } else {
                response.getWriter().print("ok");
            }
        }

        return null;
    }

    /**
     * 注册页面，控制层
     * @param user
     * @param passwordz
     * @param model
     * @param session
     * @param code
     * @return
     */
    @RequestMapping("doRegister")
    public String doRegister(User user, String passwordz, Model model,HttpSession session,String code) {
        boolean flag = true;
        if (user.getUsername() == null || "".equals(user.getUsername().trim())) {
            model.addAttribute("username", "用户名不能为空");
            flag = false;
        }
        if (user.getPassword() == null || "".equals(user.getPassword().trim())) {
            model.addAttribute("password", "密码不能为空");
            flag = false;
        }
        if (!user.getPassword().trim().equals(passwordz.trim())) {
            model.addAttribute("password1", "密码输入不一致");
            flag = false;
        }
        if (user.getName() == null || "".equals(user.getName().trim())) {
            model.addAttribute("name", "真实姓名不能为空");
            flag = false;
        }
        if (user.getEmail() == null || "".equals(user.getEmail().trim())) {
            model.addAttribute("email", "电子邮件不能为空");
            flag = false;
        }
        if (user.getPhone() == null || "".equals(user.getPhone().trim())) {
            model.addAttribute("phone", "电话号码不能为空");
            flag = false;
        }
        String yzmcode = session.getAttribute("sessioncode").toString();
        if(code==null||"".equals(code.trim())){
            model.addAttribute("scode", "验证码不能为空");
            flag = false;
        }
        if(!code.trim().equalsIgnoreCase(yzmcode)){
            model.addAttribute("scode", "验证码输入错误");
            flag = false;
        }
        if (flag) {
            userService.addUser(user);
            return "redirect:/user/login.do";
        } else {
            return "register";//回到逻辑视图中，带着model里的数据；
        }
    }

    /**
     *注册成功，跳转页面到login.jsp
     * @return
     */
    @RequestMapping("login")
    public String login(){
        return "login";
    }

    /**
     * 登录页
     * @return
     */
    @RequestMapping("doLogin")
    public String doLogin(User user,Model model,String check,HttpServletResponse response,HttpSession session){
        boolean flag = true ;
        if(user.getPhone()==null||"".equals(user.getPhone().trim())){
            model.addAttribute("phone","用户名不能为空");
            flag = false;
        }
        if(user.getPassword()==null||"".equals(user.getPassword().trim())){
            model.addAttribute("password","密码不能为空");
            flag = false;
        }
        if(flag){
            User loginUser = userService.findLoginUser(user);
            if(loginUser==null){
                model.addAttribute("msg","用户名或密码不存在");
                return "login";
            }else if(loginUser.getState()==0){
                model.addAttribute("msg","您已被管理员禁用");
                return "login";
            }else{
                //保存session
                session.setAttribute("loginUser",loginUser);
                //保存cookie
                System.out.println(user.getPhone()+"+++++++++++++++++++++++++++"+user.getPassword());
                Cookie nameCookie = new Cookie("phone",user.getPhone());
                Cookie passwordCookie = new Cookie("password",user.getPassword());
                if(check!=null){
                    nameCookie.setMaxAge(60*60*24*7);
                    passwordCookie.setMaxAge(60*60*24*7);
                }else{
                    nameCookie.setMaxAge(0);
                    passwordCookie.setMaxAge(0);
                }
                nameCookie.setPath("/");
                passwordCookie.setPath("/");
                response.addCookie(nameCookie);
                response.addCookie(passwordCookie);
                return "redirect:/user/gerenziliao.do";
            }
        }else{
            return "login";
        }
    }

    /**
     * 登录成功，跳转页面到个人资料
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("gerenziliao")
    public String gerenziliao(HttpServletRequest request,HttpSession session){
        /**
         * 在缓存中没有一级，二级类目，商品，就从数据库中取，再放入缓存
         */
        GetallCategoryExtUtil.getallCategory(request);
        if(session.getAttribute("loginUser")==null){
                return "login";
        }
        return "gerenziliao";
    }

    /**
     * 个人信息修改ajax修改
     * @param user
     * @param response
     * @throws IOException
     */
    @RequestMapping("updatePersonUser")
    public void updatePersonUser(User user,HttpServletResponse response,HttpSession session) throws IOException {
        if(user.getPassword()==null||"".equals(user.getPassword().trim())||user.getName() == null || "".equals(user.getName().trim())||user.getEmail() == null || "".equals(user.getEmail().trim())){
            response.getWriter().print("usernull");
        }else{
            userService.updatePersonUser(user);
            session.setAttribute("loginUser",user);
            response.getWriter().print("ok");
        }

    }

}

