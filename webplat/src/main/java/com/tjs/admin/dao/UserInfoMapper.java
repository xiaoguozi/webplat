package com.tjs.admin.dao;

import java.util.List;

import com.tjs.admin.model.UserInfo;
import com.tjs.core.generic.GenericDao;

/**
 * 用户Dao接口
 * 
 * @author swpan
 * @since 2014年7月5日 上午11:49:57
 **/
public interface UserInfoMapper extends GenericDao<UserInfo, Long> {
  

    int deleteByPrimaryKey(Long id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);


    UserInfo selectByPrimaryKey(Long id);


    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);

    List<UserInfo> selectList();
    
    Integer selectListCount();
}