package com.yc.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface CommentLikeMapper {
    Integer getCommentLikeNumByCommentId(Integer commentId) throws Exception;
}
