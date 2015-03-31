
package com.tjs.admin.controller;

import com.tjs.admin.model.User;
import com.tjs.core.generic.GenericCtrlModel;


/**
 * 控制模型
 * 
 * @author swpan
 *
 */
public class UserCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	User user;
	
	

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
	

}
