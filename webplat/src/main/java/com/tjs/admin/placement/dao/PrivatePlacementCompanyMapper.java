package com.tjs.admin.placement.dao;

import java.util.List;

import com.tjs.admin.placement.model.PrivatePlacementCompany;
import com.tjs.core.generic.GenericDao;

/**
 * 私募公司DAO
 * 
 *@Author zhsoft
 *@Time 2015年3月25日
 *
 **/
public interface PrivatePlacementCompanyMapper extends GenericDao<PrivatePlacementCompany, Long> {
	
	int insertPrivatePlacementCompany(PrivatePlacementCompany privatePlacementCompany);
	
	int deletePrivatePlacementCompany(long privatePlacementCompanyId);
	
	List<PrivatePlacementCompany> getPrivatePlacementCompanyList();
   

}