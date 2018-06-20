package com.blog.service;

import com.blog.entity.AdminLoginLog;

import java.util.List;

public interface AdminLoginLogService {
//    插入登陆记录
    int insertLoginLog(AdminLoginLog adminLoginLog);

//    得到某一adminId登录的所有记录
    List<AdminLoginLog> getAllLogin(Integer adminId);

//    得到某一adminId登录的次数
    int getCountByAdminId(int adminId);
}
