package com.tjs.admin.pe.service;

import java.util.List;

import com.tjs.admin.pe.controller.PECompanyCtrlModel;
import com.tjs.admin.pe.model.PECompany;

/**
 * 私募公司服务接口
 * 
 *@Author zhsoft
 *@Time 2015年3月26日
 **/
public interface PECompanyService  {
	
	int insertPECompany(PECompany peCompany);
	
    int deletePECompany(long peCompanyId);
	
	int updatePECompany(PECompany peCompany);
	
	List<PECompany> getPECompanyList();
	
	Integer selectListCount();
	
	PECompany getPECompanyById(long peCompanyId);
	
	int updatePECompany(PECompany peCompany, PECompanyCtrlModel peCompanyCtrlModel);
	
	int insertPECompany(PECompany peCompany, PECompanyCtrlModel peCompanyCtrlModel);
	
	int deleteBatchPECompany(long[] ids);
}
