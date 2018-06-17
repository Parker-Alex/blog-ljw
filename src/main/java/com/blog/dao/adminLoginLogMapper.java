package com.blog.dao;

import com.blog.entity.adminLoginLog;
import com.blog.entity.adminLoginLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface adminLoginLogMapper {
    long countByExample(adminLoginLogExample example);

    int deleteByExample(adminLoginLogExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(adminLoginLog record);

    int insertSelective(adminLoginLog record);

    List<adminLoginLog> selectByExample(adminLoginLogExample example);

    adminLoginLog selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") adminLoginLog record, @Param("example") adminLoginLogExample example);

    int updateByExample(@Param("record") adminLoginLog record, @Param("example") adminLoginLogExample example);

    int updateByPrimaryKeySelective(adminLoginLog record);

    int updateByPrimaryKey(adminLoginLog record);
}