package com.yc.service;

import com.yc.model.BlogAndUserCustom;
import com.yc.model.User;
import org.springframework.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserService {
    boolean isUserEixst(String account) throws Exception;

    void addUser(User user) throws Exception;

    List<User> getUserByAccount(String account) throws Exception;

    void updateUser(User updateUser) throws Exception;

    List<BlogAndUserCustom> getAllBlogByUserId(Integer userId) throws Exception;

    User getUserByUserId(Integer userId) throws Exception;

    void userLoginSuccess(HttpServletRequest request, HttpSession session, User user) throws Exception;
}
