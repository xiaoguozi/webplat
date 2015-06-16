package com.tjs.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.web.dao.CustIdentityMapper;
import com.tjs.web.model.CustIdentity;
import com.tjs.web.service.CustIdentityService;

@Service
public class CustIdentityServiceImpl implements CustIdentityService {
	
	@Resource
	private CustIdentityMapper custIdentityMapper;
	
	@Resource
	private UserInfoService userInfoService;

	@Override
	public List<CustIdentity> query(CustIdentity custIdentity) {
		return custIdentityMapper.query(custIdentity);
	}

	@Override
	public void insertCustIdentity(CustIdentity custIdentity) {
		custIdentityMapper.insertCustIdentity(custIdentity);
	}

	@Override
	public void validateCustIdentity(CustIdentity custIdentity,
			UserInfo userInfo) {
		insertCustIdentity(custIdentity);
		if(userInfo!=null){
			userInfoService.updateUserInfo(userInfo);
		}
	}

}
