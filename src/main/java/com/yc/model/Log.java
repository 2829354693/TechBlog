package com.yc.model;

import java.io.Serializable;
import java.util.Date;

public class Log implements Serializable {
    private Integer logId;
    private String logName;
    private Date logTime;
    private String logIp;
    private String logWay;

    public Log() {
    }

    public Log(String logName, Date logTime, String logIp, String logWay) {
        this.logName = logName;
        this.logTime = logTime;
        this.logIp = logIp;
        this.logWay = logWay;
    }

    public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public String getLogName() {
        return logName;
    }

    public void setLogName(String logName) {
        this.logName = logName;
    }

    public Date getLogTime() {
        return logTime;
    }

    public void setLogTime(Date logTime) {
        this.logTime = logTime;
    }

    public String getLogIp() {
        return logIp;
    }

    public void setLogIp(String logIp) {
        this.logIp = logIp;
    }

    public String getLogWay() {
        return logWay;
    }

    public void setLogWay(String logWay) {
        this.logWay = logWay;
    }
}
