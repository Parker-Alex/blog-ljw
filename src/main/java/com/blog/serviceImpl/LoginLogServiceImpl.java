package com.blog.serviceImpl;

import com.blog.dao.AdminLoginLogMapper;
import com.blog.entity.AdminLoginLog;
import com.blog.service.AdminLoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginLogServiceImpl implements AdminLoginLogService {

    @Autowired
    private AdminLoginLogMapper adminLoginLogMapper;

    @Override
    public int insertLoginLog(AdminLoginLog adminLoginLog) {
        int i = adminLoginLogMapper.insertSelective(adminLoginLog);
        return i;
    }
}
