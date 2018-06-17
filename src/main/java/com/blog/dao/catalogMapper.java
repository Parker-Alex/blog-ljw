package com.blog.dao;

import com.blog.entity.catalog;
import com.blog.entity.catalogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface catalogMapper {
    long countByExample(catalogExample example);

    int deleteByExample(catalogExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(catalog record);

    int insertSelective(catalog record);

    List<catalog> selectByExampleWithBLOBs(catalogExample example);

    List<catalog> selectByExample(catalogExample example);

    catalog selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") catalog record, @Param("example") catalogExample example);

    int updateByExampleWithBLOBs(@Param("record") catalog record, @Param("example") catalogExample example);

    int updateByExample(@Param("record") catalog record, @Param("example") catalogExample example);

    int updateByPrimaryKeySelective(catalog record);

    int updateByPrimaryKeyWithBLOBs(catalog record);

    int updateByPrimaryKey(catalog record);
}