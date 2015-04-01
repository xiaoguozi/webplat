package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.model.PECompany;
import com.tjs.core.generic.GenericDao;

/**
 * 私募公司DAO
 * 
 *@Author zhsoft
 *@Time 2015年3月25日
 *
 **/
public interface PECompanyMapper  {
	
	int insertPECompany(PECompany peCompany);
	
	int deletePECompany(int peCompanyId);
	
	int updatePECompany(PECompany peCompany);
	
	List<PECompany> getPECompanyList();
	
	Integer selectListCount();

}