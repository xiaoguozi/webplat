package com.tjs.admin.pe.service;

import java.util.List;
import java.util.Map;

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
	
	PECompany getPECompanyById(long peCompanyId);
	
	int updatePECompany(PECompany peCompany, PECompanyCtrlModel peCompanyCtrlModel);
	
	int insertPECompany(PECompany peCompany, PECompanyCtrlModel peCompanyCtrlModel);
	
	int deleteBatchPECompany(long[] ids);
	
	Integer selectListCount(PECompanyCtrlModel peCompanyCtrlModel);
	
	List<PECompany> getPECompanyList(PECompanyCtrlModel peCompanyCtrlModel);
	
	/**
	 * 获取上线的私募公司清单 
	 * 
	 * @return Map值 total：记录数， data：数据集
	 */
	Map<String, Object> getOnLinePECompany(String keyword);
}
