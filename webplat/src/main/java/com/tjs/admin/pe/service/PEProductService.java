package com.tjs.admin.pe.service;

import java.util.List;

import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.model.PEProduct;

/**
 *@Author zhsoft
 *@Time 2015年3月26日
 *
 * 私募公司服务接口
 **/
public interface PEProductService  {
	
	int insertPEProduct(PEProduct peProduct);
	
    int deletePEProduct(long peProductId);
	
	int updatePEProduct(PEProduct peProduct);
	
	List<PEProduct> getPEProductList();
	
	Integer selectListCount();
	
	PEProduct getPEProductById(long peProductId);
}
