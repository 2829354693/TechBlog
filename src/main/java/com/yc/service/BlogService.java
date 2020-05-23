package com.yc.service;

import com.yc.model.Blog;
import com.yc.model.BlogAndUserCustom;

import java.util.List;

public interface BlogService {
    void insertBlog(Blog blog) throws Exception;

    List<BlogAndUserCustom> getTenBlogAndUser() throws Exception;

    List<BlogAndUserCustom> getTenBlogAndUserByType(String type) throws Exception;

    Integer getCommentNumByBlogId(Integer blogId) throws Exception;

    Integer getBlogLikeNumByBlogId(Integer blogId) throws Exception;

    void updateBlogReadNum(Integer blogId) throws Exception;

    Blog getBlogByBlogId(Integer blogId) throws Exception;
    
    List<BlogAndUserCustom> getBlogbyFuzzyFilter(String titlePart); //zh
}
