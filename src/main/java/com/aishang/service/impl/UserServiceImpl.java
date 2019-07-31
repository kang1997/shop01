package com.aishang.service.impl;

import com.aishang.dao.IUserDao;
import com.aishang.po.User;
import com.aishang.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    /**
     * 框架搭建测试代码，根据id查找
     * @param userId
     * @return
     */
    public User selectUser(long userId) {
        return this.userDao.selectUser(userId);
    }

    /**
     * 查找姓名
     * @param username
     * @return
     */
    @Override
    public User findUserByName(String username) {
        return this.userDao.findUserByName(username);
    }
    /**
     * 查找手机号
     * @param phone
     * @return
     */
    @Override
    public User findUserByPhone(String phone) {
        return this.userDao.findUserByPhone(phone);
    }
    /**
     * 用户注册
     * @param user
     */
    @Override
    public void addUser(User user) {
        this.userDao.addUser(user);
    }

    /**
     * 查找登录用户是否存在
     * @param user
     * @return
     */
    @Override
    public User findLoginUser(User user) {
        return this.userDao.findLogiinUser(user);
    }

    /**
     * 修改个人信息
     * @param user
     */
    @Override
    public void updatePersonUser(User user) {
        this.userDao.updatePersonUser(user);
    }
}

