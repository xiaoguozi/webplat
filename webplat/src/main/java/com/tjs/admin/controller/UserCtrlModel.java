
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
	
	private int limitStart;
	
	private User user;
	
	private int totalPageSize;
	
	public int getLimitStart() {
		return (this.getPageNo()-1)*this.getPageSize();
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}
	
	

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
	
	public int getTotalPageSize() {
		if(super.getTotalCount()%super.getPageSize()==0){
			return super.getTotalCount()/super.getPageSize();
		}else{
			return super.getTotalCount()/super.getPageSize()+1;
		}
	}

	public void setTotalPageSize(int totalPageSize) {
		this.totalPageSize = totalPageSize;
	}
	

}
