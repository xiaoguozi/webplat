package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.model.PETopProduct;

/**
 * 私募产品DAO
 * 
 *@Author zhsoft
 *@Time 2015年3月25日
 *
 **/
public interface PEIndexMapper  {
	
	List<PETopProduct> getTop4PEProductList();
	
	List<PETopProduct> getTop4AnyPEProductList();
	
	List<PETopProduct> getTop10PEProductList();
	
	Integer selectListCount(PEProductCtrlModel peProductCtrlModel);
	
	List<PETopProduct> getAnyPEProductList(PEProductCtrlModel peProductCtrlModel);
}