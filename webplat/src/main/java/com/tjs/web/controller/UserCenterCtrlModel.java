
package com.tjs.web.controller;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.core.generic.GenericCtrlModel;


/**
 * 控制模型
 * 
 * @author swpan
 *
 */
public class UserCenterCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	User user;
	
	UserInfo userInfo;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

}
