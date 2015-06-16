package com.tjs.web.service;

import java.util.List;

import com.tjs.admin.model.UserInfo;
import com.tjs.web.model.CustIdentity;

public interface CustIdentityService {

	/**
	 * 查询数据
	 * @param custIdentity
	 * @return
	 */
	List<CustIdentity> query(CustIdentity custIdentity);
	
	/**
	 * 插入数据
	 * @param custIdentity
	 */
	void insertCustIdentity(CustIdentity custIdentity);
	
	/**
	 * 实名验证
	 * @param custIdentity
	 * @param userInfo
	 */
	void validateCustIdentity(CustIdentity custIdentity, UserInfo userInfo);
	
}
