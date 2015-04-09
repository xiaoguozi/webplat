package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.model.PEProduct;

/**
 * 私募产品DAO
 * 
 *@Author zhsoft
 *@Time 2015年3月25日
 *
 **/
public interface PEProductMapper  {
	
	int insertPEProduct(PEProduct peProduct);
	
	int deletePEProductById(long peProductId);
	
	int updatePEProduct(PEProduct peProduct);
	
	List<PEProduct> getPEProductList();
	
	Integer selectListCount();

	PEProduct getPEProductById(long peProductId);
	
	
}