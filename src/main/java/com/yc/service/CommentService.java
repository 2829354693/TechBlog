package com.yc.service;

import com.yc.model.Comment;
import com.yc.model.CommentAndUserCustom;

import java.util.List;

public interface CommentService {
    List<Comment> getAllCommentByBlogId(Integer blogId) throws Exception;

    List<CommentAndUserCustom> getCommentAndUsersByBlogId(Integer blogId) throws Exception;

    Integer getCommentLikeNumByCommentId(Integer commentId) throws Exception;

    void addComment(Comment comment) throws Exception;

    boolean isUserAlreadyLikeComment(Integer commentId, Integer userId) throws Exception;

    void addCommentLike(Integer commentId, Integer userId) throws Exception;
}
