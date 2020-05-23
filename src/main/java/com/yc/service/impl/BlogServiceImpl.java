package com.yc.service.impl;

import com.github.pagehelper.PageHelper;
import com.yc.mapper.BlogAndUserCustomMapper;
import com.yc.mapper.BlogLikeMapper;
import com.yc.mapper.BlogMapper;
import com.yc.mapper.CommentMapper;
import com.yc.model.Blog;
import com.yc.model.BlogAndUserCustom;
import com.yc.model.BlogLike;
import com.yc.model.Comment;
import com.yc.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
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
    public List<BlogAndUserCustom> getPageBlogAndUser(Integer pageIndex, Integer pageSize) throws Exception {
        PageHelper.startPage(pageIndex, pageSize);
        return blogAndUserCustomMapper.getAllBlogAndUser();
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

    //模糊查询（zh）
    @Override
    public List<BlogAndUserCustom> getBlogbyFuzzyFilter(String titlePart){
        return blogAndUserCustomMapper.getBlogbyFuzzyFilter(titlePart);
    }

    @Override
    public boolean isUserAlreadyLikeBlog(Integer blogId, Integer userId) throws Exception {
        Integer blogLikeNum = blogLikeMapper.getBlogLikeNumByBlogIdAndUserId(blogId, userId);
        return blogLikeNum != 0;
    }

    @Override
    public void addBlogLikeNum(Integer blogId, Integer userId) throws Exception {
        blogLikeMapper.addBlogLikeNum(blogId, userId);
    }

    @Override
    public List<Blog> getTopTenBlog() throws Exception {
        return blogMapper.getTopTenBlogByReadNum();
    }

    @Override
    public List<BlogAndUserCustom> getBlogLikeByUserId(Integer userId) throws Exception{
        List<BlogLike> blogLikes =  blogLikeMapper.getBlogLikeByUserId(userId);
        List<BlogAndUserCustom> blogLikeInfos = new ArrayList<>();
        for (BlogLike blog:blogLikes){
            BlogAndUserCustom blogInfo = blogAndUserCustomMapper.getInfoByBlogId(blog.getBlogId());
            blogLikeInfos.add(blogInfo);
        }
        return blogLikeInfos;
    }

    @Override
    public List<BlogAndUserCustom> getAllCommentByUserId(Integer userId) throws Exception{
        List<Comment> comments =  commentMapper.getAllCommentByUserId(userId);
        List<BlogAndUserCustom> commentInfos = new ArrayList<>();
        for (Comment comment:comments){
            BlogAndUserCustom commentInfo = blogAndUserCustomMapper.getInfoByBlogId(comment.getBlogId());
            commentInfos.add(commentInfo);
        }
        return commentInfos;
    }

    @Override
    public void deleteBlog(Integer blogId) throws Exception {
        blogMapper.deleteBlog(blogId);
    }
}
