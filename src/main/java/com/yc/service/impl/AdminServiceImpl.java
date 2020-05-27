package com.yc.service.impl;

import com.yc.mapper.AdminMapper;
import com.yc.mapper.UserMapper;
import com.yc.model.AdminUser;
import com.yc.model.Blog;
import com.yc.model.User;
import com.yc.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;

    @Autowired
    UserMapper userMapper;

    @Override
    public AdminUser getAdminUserByAccount(String account) throws Exception {
        return adminMapper.getAdminUserByAccount(account);
    }

    @Override
    public List<User> getAllUser() throws Exception {
        return userMapper.getAllUser();
    }

    @Override
    public List<User> getUserByUsername(String username) throws Exception {
        return adminMapper.getUserByUsername(username);
    }

    @Override
    public void deleteUserByUserId(Integer userId) throws Exception {
        adminMapper.deleteUserByUserId(userId);
    }

    @Override
    public void updateUserPassword(Integer userId, String salt, String newPass) throws Exception {
        adminMapper.updateUserPassword(userId, salt, newPass);
    }

    @Override
    public List<Blog> getAllBlog() throws Exception {
        return adminMapper.getAllBlog();
    }

    @Override
    public List<Blog> getBlogByTitle(String title) throws Exception {
        return adminMapper.getBlogByTitle(title);
    }
}
