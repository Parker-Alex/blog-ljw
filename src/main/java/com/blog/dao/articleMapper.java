package com.blog.dao;

import com.blog.entity.article;
import com.blog.entity.articleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface articleMapper {
    long countByExample(articleExample example);

    int deleteByExample(articleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(article record);

    int insertSelective(article record);

    List<article> selectByExampleWithBLOBs(articleExample example);

    List<article> selectByExample(articleExample example);

    article selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") article record, @Param("example") articleExample example);

    int updateByExampleWithBLOBs(@Param("record") article record, @Param("example") articleExample example);

    int updateByExample(@Param("record") article record, @Param("example") articleExample example);

    int updateByPrimaryKeySelective(article record);

    int updateByPrimaryKeyWithBLOBs(article record);

    int updateByPrimaryKey(article record);
}