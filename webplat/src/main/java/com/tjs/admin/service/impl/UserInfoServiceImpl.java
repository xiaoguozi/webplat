package com.tjs.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.dao.UserInfoMapper;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.core.generic.GenericDao;
import com.tjs.core.generic.GenericServiceImpl;

/**
 * 用户Service实现类
 *
 * @author StarZou
 * @since 2014年7月5日 上午11:54:24
 */
@Service
public class UserInfoServiceImpl extends GenericServiceImpl<UserInfo, Long> implements UserInfoService {

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int insert(UserInfo model) {
        return userInfoMapper.insertSelective(model);
    }

    @Override
    public int update(UserInfo model) {
        return userInfoMapper.updateByPrimaryKeySelective(model);
    }

    @Override
    public int delete(Long id) {
        return userInfoMapper.deleteByPrimaryKey(id);
    }


    @Override
    public UserInfo selectById(Long id) {
        return userInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public GenericDao<UserInfo, Long> getDao() {
        return userInfoMapper;
    }

    @Override
    public List<UserInfo> selectList() {
    	return userInfoMapper.selectList();
    }

	@Override
	public UserInfo findUserInfoByUserId(Long userId) {
		// TODO Auto-generated method stub
		return userInfoMapper.findUserInfoByUserId(userId);
	}

	@Override
	public int updateUserInfo(UserInfo userInfo) {
		return userInfoMapper.updateByPrimaryKeySelective(userInfo);
	}
    
}
