package com.yc.service.impl;

import com.yc.mapper.BlogAndUserCustomMapper;
import com.yc.mapper.UserMapper;
import com.yc.model.BlogAndUserCustom;
import com.yc.model.User;
import com.yc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    UserMapper userMapper;

    @Resource
    BlogAndUserCustomMapper blogAndUserCustomMapper;

    @Override
    public boolean isUserEixst(String account) throws Exception {
        List<User> user = userMapper.getUserByAccount(account);
        return user != null && user.size() > 0;
    }

    @Override
    public void addUser(User user) throws Exception {
        userMapper.insertUser(user);
    }

    @Override
    public List<User> getUserByAccount(String account) throws Exception {
        return userMapper.getUserByAccount(account);
    }

    @Override
    public void updateUser(User updateUser) throws Exception {
        userMapper.updateUser(updateUser);
    }

    @Override
    public List<BlogAndUserCustom> getAllBlogByUserId(Integer userId) throws Exception {
        return blogAndUserCustomMapper.getAllBlogByUserId(userId);
    }


}
