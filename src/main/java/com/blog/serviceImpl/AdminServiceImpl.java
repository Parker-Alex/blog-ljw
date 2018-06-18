package com.blog.serviceImpl;

import com.blog.dao.AdminMapper;
import com.blog.entity.Admin;
import com.blog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin getAdminById(Integer id) {
         Admin admin = adminMapper.selectByPrimaryKey(id);
        return admin;
    }
}
