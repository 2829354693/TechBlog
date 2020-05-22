package com.yc.mapper;

import com.yc.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    List<User> getUserByAccount(String account) throws Exception;

    void insertUser(User user) throws Exception;

    void updateUser(User user) throws Exception;

}
