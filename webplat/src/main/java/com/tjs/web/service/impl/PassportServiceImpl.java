package com.tjs.web.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.dao.UserMapper;
import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.core.generic.GenericDao;
import com.tjs.core.generic.GenericServiceImpl;
import com.tjs.web.service.PassportService;

/**
 * 用户Service实现类
 *
 * @author StarZou
 * @since 2014年7月5日 上午11:54:24
 */
@Service
public class PassportServiceImpl implements PassportService {

    @Resource
    private UserService userService;

    @Resource
    private UserInfoService userInfoService;
    
    @Resource
    private UserMapper userMapper;
    
    @Override
    public long regUser(User user, UserInfo userInfo) {
    	userService.insert(user);
    	Long userId = user.getId();
    	if(userId>0){
    		userInfo.setUserId(userId);
    		userInfoService.insert(userInfo);
    	}
    	
    	return userId;
    }
    
    @Override
	public boolean validUserName(String userName){
    	boolean isValid = true;
    	int count = userMapper.selectCountByUserName(userName);
    	if(count >0){
    		isValid = false;
    	}
    	
    	return isValid;
    }
    
}
