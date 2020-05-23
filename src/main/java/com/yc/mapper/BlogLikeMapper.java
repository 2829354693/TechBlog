package com.yc.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface BlogLikeMapper {
    Integer getBlogLikeNumByBlogId(Integer blogId) throws Exception;

    Integer getBlogLikeNumByBlogIdAndUserId(Integer blogId, Integer userId) throws Exception;

    void addBlogLikeNum(Integer blogId, Integer userId) throws Exception;
}
