package com.tjs.admin.service;

import com.tjs.admin.model.UserInfo;
import com.tjs.core.generic.GenericService;

/**
 * 用户 业务 接口
 * 
 * @author StarZou
 * @since 2014年7月5日 上午11:53:33
 **/
public interface UserInfoService extends GenericService<UserInfo, Long> {
	
	 UserInfo findUserInfoByUserId(Long userId);

	 int updateUserInfo(UserInfo userInfo);
}
