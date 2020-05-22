package com.yc.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface BlogLikeMapper {
    Integer getBlogLikeNumByBlogId(Integer blogId);
}
