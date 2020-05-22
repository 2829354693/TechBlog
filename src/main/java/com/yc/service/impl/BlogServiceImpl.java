package com.yc.service.impl;

import com.yc.mapper.BlogAndUserCustomMapper;
import com.yc.mapper.BlogLikeMapper;
import com.yc.mapper.BlogMapper;
import com.yc.mapper.CommentMapper;
import com.yc.model.Blog;
import com.yc.model.BlogAndUserCustom;
import com.yc.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {

    @Resource
    BlogMapper blogMapper;

    @Resource
    BlogLikeMapper blogLikeMapper;

    @Resource
    CommentMapper commentMapper;

    @Resource
    BlogAndUserCustomMapper blogAndUserCustomMapper;

    @Override
    public void insertBlog(Blog blog) throws Exception {
        blogMapper.insertBlog(blog);
    }

    @Override
    public List<BlogAndUserCustom> getTenBlogAndUser() throws Exception {
        return blogAndUserCustomMapper.getTenBlogAndUser();
    }

    @Override
    public List<BlogAndUserCustom> getTenBlogAndUserByType(String type) throws Exception {
        return blogAndUserCustomMapper.getTenBlogAndUserByType(type);
    }

    @Override
    public Integer getCommentNumByBlogId(Integer blogId) throws Exception {
        return commentMapper.getNumByBlogId(blogId);
    }

    @Override
    public Integer getBlogLikeNumByBlogId(Integer blogId) throws Exception {
        return blogLikeMapper.getBlogLikeNumByBlogId(blogId);
    }

    @Override
    public void updateBlogReadNum(Integer blogId) throws Exception {
        blogMapper.updateBlogReadNum(blogId);
    }

    @Override
    public Blog getBlogByBlogId(Integer blogId) throws Exception {
        return blogMapper.getBlogByBlogId(blogId);
    }
}
