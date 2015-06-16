package com.tjs.web.dao;

import java.util.List;

import com.tjs.web.model.CustIdentity;

public interface CustIdentityMapper {

	List<CustIdentity> query(CustIdentity custIdentity);
	void insertCustIdentity(CustIdentity custIdentity);
}
