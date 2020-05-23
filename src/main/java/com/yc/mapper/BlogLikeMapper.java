package com.yc.mapper;

import com.yc.model.BlogLike;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogLikeMapper {
    Integer getBlogLikeNumByBlogId(Integer blogId) throws Exception;

    Integer getBlogLikeNumByBlogIdAndUserId(Integer blogId, Integer userId) throws Exception;

    void addBlogLikeNum(Integer blogId, Integer userId) throws Exception;

    List<BlogLike> getBlogLikeByUserId(Integer userId) throws Exception;
}
