package com.yc.mapper;

import com.yc.model.CommentAndUserCustom;

import java.util.List;

public interface CommentAndUserCustomMapper {
    List<CommentAndUserCustom> getCommentAndUsersByBlogId(Integer blogId) throws Exception;
}
