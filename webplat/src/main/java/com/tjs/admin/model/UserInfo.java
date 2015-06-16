package com.tjs.admin.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户模型
 * 
 * @author swpan
 * @since 2014年7月5日 下午12:07:20
 **/
public class UserInfo implements Serializable{
	private static final long serialVersionUID = 1L;

	private Long id;

    private Long userId;
    private String nickName;
    private String mobileNo;
    private String qqNo;
    private String wechatNo;
    private String email;
    private Date regTime;
    private String userStatus;
    private String name;
    private String certId;
    private int isValidate;

    public UserInfo() {

    }


    public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Long getUserId() {
		return userId;
	}


	public void setUserId(Long userId) {
		this.userId = userId;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getMobileNo() {
		return mobileNo;
	}


	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}


	public String getQqNo() {
		return qqNo;
	}


	public void setQqNo(String qqNo) {
		this.qqNo = qqNo;
	}


	public String getWechatNo() {
		return wechatNo;
	}


	public void setWechatNo(String wechatNo) {
		this.wechatNo = wechatNo;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getRegTime() {
		return regTime;
	}


	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}


	public String getUserStatus() {
		return userStatus;
	}


	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getCertId() {
		return certId;
	}


	public void setCertId(String certId) {
		this.certId = certId;
	}

	

	public int getIsValidate() {
		return isValidate;
	}


	public void setIsValidate(int isValidate) {
		this.isValidate = isValidate;
	}


	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", userId=" + userId + ", nickName="
				+ nickName + ", mobileNo=" + mobileNo + ", qqNo=" + qqNo
				+ ", wechatNo=" + wechatNo + ", email=" + email + ", regTime="
				+ regTime + ", userStatus=" + userStatus + ", name=" + name
				+ ", certId=" + certId + ", isValidate=" + isValidate + "]";
	}


}