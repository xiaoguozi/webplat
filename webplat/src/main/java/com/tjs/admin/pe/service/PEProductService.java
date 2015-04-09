package com.tjs.admin.pe.service;

import java.util.List;

import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.model.PEProduct;

/**
 * 私募产品服务接口
 * 
 *@Author zhsoft
 *@Time 2015年3月26日
 **/
public interface PEProductService  {
	
	int insertPEProduct(PEProduct peProduct);
	
    int deletePEProduct(long peProductId);
	
	int updatePEProduct(PEProduct peProduct);
	
	List<PEProduct> getPEProductList();
	
	Integer selectListCount();
	
	PEProduct getPEProductById(long peProductId);
	
	int insertPEProduct(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel);
	
	int updatePEProduct(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel);
}
