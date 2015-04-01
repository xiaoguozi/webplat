package com.tjs.admin.pe.service;

import java.util.List;

import com.tjs.admin.pe.model.PECompany;

/**
 *@Author zhsoft
 *@Time 2015年3月26日
 *
 * 私募公司服务接口
 **/
public interface PECompanyService  {
	
	int insertPECompany(PECompany peCompany);
	
    int deletePECompany(int peCompanyId);
	
	int updatePECompany(PECompany peCompany);
	
	List<PECompany> getPECompanyList();
}
