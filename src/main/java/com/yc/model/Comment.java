package com.yc.model;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable {
    private Integer id;
    private String content;
    private Date time;
    private Integer userId;
    private Integer blogId;

    public Comment() {
    }

    public Comment(String content, Date time, Integer userId, Integer blogId) {
        this.content = content;
        this.time = time;
        this.userId = userId;
        this.blogId = blogId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }
}
