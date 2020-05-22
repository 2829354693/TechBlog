package com.yc.model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

public class Blog implements Serializable {
    private Integer id;
    private String title;
    private String content;
    private String pics;
    private Date time;
    private String type;
    private Integer readNum;
    private Integer userId;

    public Blog() {
    }

    public Blog(String title, String content, String pics, Date time, String type, Integer readNum, Integer userId) {
        this.title = title;
        this.content = content;
        this.pics = pics;
        this.time = time;
        this.type = type;
        this.readNum = readNum;
        this.userId = userId;
    }

    public Integer getReadNum() {
        return readNum;
    }

    public void setReadNum(Integer readNum) {
        this.readNum = readNum;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
}
