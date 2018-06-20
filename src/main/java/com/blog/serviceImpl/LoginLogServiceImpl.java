package com.blog.serviceImpl;

import com.blog.dao.AdminLoginLogMapper;
import com.blog.entity.Admin;
import com.blog.entity.AdminLoginLog;
import com.blog.service.AdminLoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginLogServiceImpl implements AdminLoginLogService {

    @Autowired
    private AdminLoginLogMapper adminLoginLogMapper;

    @Override
    public int insertLoginLog(AdminLoginLog adminLoginLog) {
        int i = adminLoginLogMapper.insertSelective(adminLoginLog);
        return i;
    }

    @Override
    public List<AdminLoginLog> getAllLogin(Integer adminId) {
        List<AdminLoginLog> adminLoginLogs = adminLoginLogMapper.getAllLogin(adminId);
        return adminLoginLogs;
    }

    @Override
    public int getCountByAdminId(int adminId) {
        int i = adminLoginLogMapper.getCountByAdminId(adminId);
        return i;
    }
}
