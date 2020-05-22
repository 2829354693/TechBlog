package com.yc.model;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private Integer id;
    private String account;
    private String password;
    private String name;
    private String signature;
    private String headPic;
    private Date time;
    private String salt;

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public User() {
    }

    public User(String account, String password, String salt, String name, String signature, String headPic, Date time) {
        this.account = account;
        this.password = password;
        this.salt = salt;
        this.name = name;
        this.signature = signature;
        this.headPic = headPic;
        this.time = time;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }
}
