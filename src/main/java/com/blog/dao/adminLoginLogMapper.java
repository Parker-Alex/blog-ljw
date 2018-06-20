package com.blog.dao;

import com.blog.entity.AdminLoginLog;
import com.blog.entity.AdminLoginLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdminLoginLogMapper {
    long countByExample(AdminLoginLogExample example);

    int deleteByExample(AdminLoginLogExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AdminLoginLog record);

    int insertSelective(AdminLoginLog record);

    List<AdminLoginLog> selectByExample(AdminLoginLogExample example);

    AdminLoginLog selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AdminLoginLog record, @Param("example") AdminLoginLogExample example);

    int updateByExample(@Param("record") AdminLoginLog record, @Param("example") AdminLoginLogExample example);

    int updateByPrimaryKeySelective(AdminLoginLog record);

    int updateByPrimaryKey(AdminLoginLog record);

    List<AdminLoginLog> getAllLogin(Integer adminId);

    int getCountByAdminId(int adminId);
}