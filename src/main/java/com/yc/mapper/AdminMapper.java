package com.yc.mapper;

import com.yc.model.AdminUser;
import com.yc.model.Blog;
import com.yc.model.User;

import java.util.List;

public interface AdminMapper {
    AdminUser getAdminUserByAccount(String account) throws Exception;

    List<User> getUserByUsername(String username) throws Exception;

    void deleteUserByUserId(Integer userId) throws Exception;

    void updateUserPassword(Integer userId, String salt, String newPass) throws Exception;

    List<Blog> getAllBlog() throws Exception;

    List<Blog> getBlogByTitle(String title) throws Exception;
}
