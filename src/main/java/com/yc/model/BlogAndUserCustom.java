package com.yc.model;

import java.io.Serializable;
import java.util.Date;

public class BlogAndUserCustom extends User implements Serializable {
    private Integer blogId;
    private String title;
    private String content;
    private String pics;
    private Date publishTime;
    private String type;
    private Integer readNum;
    private Integer userId;
    private Integer commentNum;
    private Integer likeNum;

    public BlogAndUserCustom() {
    }

    public BlogAndUserCustom(String account, String password, String salt, String name, String signature, String headPic, Date time, Integer blogId, String title, String content, String pics, Date publishTime, String type, Integer readNum, Integer userId) {
        super(account, password, salt, name, signature, headPic, time);
        this.blogId = blogId;
        this.title = title;
        this.content = content;
        this.pics = pics;
        this.publishTime = publishTime;
        this.type = type;
        this.readNum = readNum;
        this.userId = userId;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPics() {
        return pics;
    }

    public void setPics(String pics) {
        this.pics = pics;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getReadNum() {
        return readNum;
    }

    public void setReadNum(Integer readNum) {
        this.readNum = readNum;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
