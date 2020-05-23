package com.yc.mapper;

import com.yc.model.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentMapper {
    Integer getNumByBlogId(Integer blogId) throws Exception;

    List<Comment> getAllCommentByBlogId(Integer blogId) throws Exception;

    void addComment(Comment comment) throws Exception;

    List<Comment> getAllCommentByUserId(Integer userId) throws Exception;

    void deleteComment(Integer commentId) throws Exception;
}
