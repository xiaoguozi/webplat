
package com.tjs.web.controller;

import com.tjs.core.generic.GenericCtrlModel;


/**
 * 控制模型
 * 
 * @author swpan
 *
 */
public class PassportCtrlModel extends GenericCtrlModel {

	private String userName;

	private String password;

	private String verifyCode;

	private String mobileVerifyCode;

	private String email;
	
	//高铁电影码
	private String movieCode;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public String getMobileVerifyCode() {
		return mobileVerifyCode;
	}

	public void setMobileVerifyCode(String mobileVerifyCode) {
		this.mobileVerifyCode = mobileVerifyCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMovieCode() {
		return movieCode;
	}

	public void setMovieCode(String movieCode) {
		this.movieCode = movieCode;
	}
	

}
