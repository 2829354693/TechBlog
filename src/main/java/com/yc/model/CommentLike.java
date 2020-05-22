package com.yc.model;

import java.io.Serializable;

public class CommentLike implements Serializable {
    private Integer id;
    private Integer userId;
    private Integer commentId;

    public CommentLike() {
    }

    public CommentLike(Integer userId, Integer commentId) {
        this.userId = userId;
        this.commentId = commentId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }
}
