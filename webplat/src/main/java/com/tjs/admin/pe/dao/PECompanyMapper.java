package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.controller.PECompanyCtrlModel;
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

	PECompany getPECompanyById(long peCompanyId);
	
	int deleteBatchPECompany(long[] ids);
	
	List<PECompany> getPECompanyListAndPage();
	
	int selectListCount(PECompanyCtrlModel peCompanyCtrlModel);
	
	List<PECompany> getPECompanyList(PECompanyCtrlModel peCompanyCtrlModel);
}