package com.yc.service;

import com.yc.model.BlogAndUserCustom;
import com.yc.model.User;

import java.util.List;

public interface UserService {
    boolean isUserEixst(String account) throws Exception;

    void addUser(User user) throws Exception;

    List<User> getUserByAccount(String account) throws Exception;

    void updateUser(User updateUser) throws Exception;

    List<BlogAndUserCustom> getAllBlogByUserId(Integer userId) throws Exception;
}
