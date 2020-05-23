package com.yc.service.impl;

import com.yc.mapper.CommentAndUserCustomMapper;
import com.yc.mapper.CommentLikeMapper;
import com.yc.mapper.CommentMapper;
import com.yc.model.Comment;
import com.yc.model.CommentAndUserCustom;
import com.yc.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentMapper commentMapper;

    @Autowired
    CommentLikeMapper commentLikeMapper;

    @Autowired
    CommentAndUserCustomMapper commentAndUserCustomMapper;

    @Override
    public List<Comment> getAllCommentByBlogId(Integer blogId) throws Exception {
        return commentMapper.getAllCommentByBlogId(blogId);
    }

    @Override
    public List<CommentAndUserCustom> getCommentAndUsersByBlogId(Integer blogId) throws Exception {
        return commentAndUserCustomMapper.getCommentAndUsersByBlogId(blogId);
    }

    @Override
    public Integer getCommentLikeNumByCommentId(Integer commentId) throws Exception {
        return commentLikeMapper.getCommentLikeNumByCommentId(commentId);
    }

    @Override
    public void addComment(Comment comment) throws Exception {
        commentMapper.addComment(comment);
    }

    @Override
    public boolean isUserAlreadyLikeComment(Integer commentId, Integer userId) throws Exception {
        Integer commentLikeNum = commentLikeMapper.getCommentLikeNumByCommentIdAndUserId(commentId, userId);

        return commentLikeNum != 0;

    }

    @Override
    public void addCommentLike(Integer commentId, Integer userId) throws Exception {
        commentLikeMapper.addCommentLike(commentId, userId);
    }
}
