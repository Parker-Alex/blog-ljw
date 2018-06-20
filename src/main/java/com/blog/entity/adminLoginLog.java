package com.blog.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AdminLoginLog {
    private Integer id;

    private Integer adminId;

    private String ip;

    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getLastDate(){
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        String lastDate = dateFormat.format(date);
        return lastDate;
    }

    @Override
    public String toString() {
        return "AdminLoginLog{" +
                "id=" + id +
                ", adminId=" + adminId +
                ", ip='" + ip + '\'' +
                ", date=" + date +
                '}';
    }
}