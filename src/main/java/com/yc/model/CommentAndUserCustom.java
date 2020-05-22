package com.yc.model;

import java.io.Serializable;
import java.util.Date;

public class CommentAndUserCustom implements Serializable {
    private Integer commentId;
    private String commentContent;
    private Date commentTime;
    private Integer userId;
    private String headPic;
    private String username;
    private Integer commentLikeNum;
    private String headPicPath;

    public CommentAndUserCustom() {
    }

    public CommentAndUserCustom(String headPicPath, String commentContent, Date commentTime, Integer userId, String headPic, String username) {
        this.headPicPath = headPicPath;
        this.commentContent = commentContent;
        this.commentTime = commentTime;
        this.userId = userId;
        this.headPic = headPic;
        this.username = username;
    }

    public CommentAndUserCustom(Integer commentId, String commentContent, Date commentTime, Integer userId, String headPic, String username, Integer commentLikeNum) {
        this.commentId = commentId;
        this.commentContent = commentContent;
        this.commentTime = commentTime;
        this.userId = userId;
        this.headPic = headPic;
        this.username = username;
        this.commentLikeNum = commentLikeNum;
    }

    public String getHeadPicPath() {
        return headPicPath;
    }

    public void setHeadPicPath(String headPicPath) {
        this.headPicPath = headPicPath;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getCommentLikeNum() {
        return commentLikeNum;
    }

    public void setCommentLikeNum(Integer commentLikeNum) {
        this.commentLikeNum = commentLikeNum;
    }
}
