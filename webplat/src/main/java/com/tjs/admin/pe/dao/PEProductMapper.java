package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.model.PEProduct;

/**
 * 私募公司DAO
 * 
 *@Author zhsoft
 *@Time 2015年3月25日
 *
 **/
public interface PEProductMapper  {
	
	int insertPEProduct(PEProduct peProduct);
	
	int deletePEProduct(Long peProductId);
	
	int updatePEProduct(PEProduct peProduct);
	
	List<PEProduct> getPECompanyList();
	
	Integer selectListCount();

	PEProduct getPEProductById(Long peProductId);
}