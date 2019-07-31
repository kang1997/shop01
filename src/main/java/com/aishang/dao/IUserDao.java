package com.aishang.dao;

import com.aishang.po.User;

public interface IUserDao {

    /**
     * ssm框架搭建完测试代码
     * @param id
     * @return
     */
    User selectUser(long id);

    /**
     * 查找姓名
     *
     * @param username
     * @return
     */
    User findUserByName(String username);

    /**
     * 查找手机号
     *
     * @param phone
     * @return
     */
    User findUserByPhone(String phone);

    /**
     * 注册，添加用户
     *
     * @param user
     */
    void addUser(User user);

    /**
     * 查找用户登录是否存在
     * @param user
     */
    User findLogiinUser(User user);

    /**
     * 个人信息页面修改
     * @param user
     */
    void updatePersonUser(User user);

}

