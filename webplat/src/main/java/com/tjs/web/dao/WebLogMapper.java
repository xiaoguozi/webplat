package com.tjs.web.dao;

import java.util.List;

import com.tjs.core.generic.GenericDao;
import com.tjs.web.model.WebLog;

/**
 * 用户Dao接口
 * 
 * @author swpan
 * @since 2014年7月5日 上午11:49:57
 **/
public interface WebLogMapper extends GenericDao<WebLog, Long> {
  

    int deleteByPrimaryKey(Long id);

    int insert(WebLog record);

    int insertSelective(WebLog record);


    WebLog selectByPrimaryKey(Long id);


    int updateByPrimaryKeySelective(WebLog record);

    int updateByPrimaryKey(WebLog record);

    List<WebLog> selectList();
    
    Integer selectListCount();
}