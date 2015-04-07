package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.model.PECompany;

/**
 * 私募公司DAO
 * 
 *@Author zhsoft
 *@Time 2015年3月25日
 *
 **/
public interface PECompanyMapper  {
	
	int insertPECompany(PECompany peCompany);
	
	int deletePECompany(long peCompanyId);
	
	int updatePECompany(PECompany peCompany);
	
	List<PECompany> getPECompanyList();
	
	Integer selectListCount();

	PECompany getPECompanyById(Long peCompanyId);
}