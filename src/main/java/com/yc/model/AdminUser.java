package com.yc.model;

import java.io.Serializable;

public class AdminUser implements Serializable {
    private Integer adminId;
    private String account;
    private String password;

    public AdminUser() {
    }

    public AdminUser(String account, String password) {
        this.account = account;
        this.password = password;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
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
}
