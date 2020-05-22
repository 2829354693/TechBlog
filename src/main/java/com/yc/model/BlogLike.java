package com.yc.model;

import java.io.Serializable;

public class BlogLike implements Serializable {
    private Integer id;
    private Integer userId;
    private Integer blogId;

    public BlogLike() {
    }

    public BlogLike(Integer userId, Integer blogId) {
        this.userId = userId;
        this.blogId = blogId;
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

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }
}
