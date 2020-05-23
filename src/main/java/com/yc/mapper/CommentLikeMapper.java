package com.yc.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface CommentLikeMapper {
    Integer getCommentLikeNumByCommentId(Integer commentId) throws Exception;

    Integer getCommentLikeNumByCommentIdAndUserId(Integer commentId, Integer userId) throws Exception;

    void addCommentLike(Integer commentId, Integer userId) throws Exception;
}
