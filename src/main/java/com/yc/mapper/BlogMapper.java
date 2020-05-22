package com.yc.mapper;

import com.yc.model.Blog;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

public interface BlogMapper {
    void insertBlog(Blog blog) throws Exception;

    void updateBlogReadNum(Integer blogId) throws Exception;

    Blog getBlogByBlogId(Integer blogId) throws Exception;
}
