package com.yc.mapper;

import com.yc.model.Blog;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface BlogMapper {
    void insertBlog(Blog blog) throws Exception;

    void updateBlogReadNum(Integer blogId) throws Exception;

    Blog getBlogByBlogId(Integer blogId) throws Exception;

    List<Blog> getTopTenBlogByReadNum() throws Exception;

    void deleteBlog(Integer blogId) throws Exception;
}
