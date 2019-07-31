package com.aishang.service;

import com.aishang.po.User;

public interface IUserService {

    /**
     * 框架搭建测试代码
     * @param userId
     * @return
     */
    public User selectUser(long userId);

    /**
     * 注册：查找姓名
     *
     * @param username
     * @return
     */
    public User findUserByName(String username);

    /**
     * 注册：查找手机号
     *
     * @param phone
     * @return
     */
    public User findUserByPhone(String phone);

    /**
     * 用户注册
     *
     * @param user
     */
    public void addUser(User user);

    /**
     * 查找登录用户是否存在
     * @param user
     * @return
     */
    public User findLoginUser(User user);

    /**
     * 个人信息页面的修改
     * @param user
     */
    public void updatePersonUser(User user);
}

