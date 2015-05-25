package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.model.PECommonVO;
import com.tjs.admin.pe.model.PETopProduct;
import com.tjs.web.pe.controller.PESearchCtrlVO;

/**
 * 私募前台产品DAO
 * 
 *@Author zhsoft
 *@Time 2015年3月25日
 *
 **/
public interface PEIndexMapper  {
	
	List<PETopProduct> getTop4PEProductList();
	
	List<PETopProduct> getTop4AnyPEProductList();
	
	List<PETopProduct> getTop10PEProductList(PESearchCtrlVO peSearchCtrlVO);
	
	Integer selectListCount(PEProductCtrlModel peProductCtrlModel);
	
	List<PETopProduct> getAnyPEProductList(PESearchCtrlVO peSearchCtrlVO);
	
	int getAnyPEProductListCount(PESearchCtrlVO peSearchCtrlVO);
	
	List<PECommonVO> getYearAll();
	
	int getRatePEProductListCount(PESearchCtrlVO peSearchCtrlVO);
	
	List<PETopProduct> getRatePEProductList(PESearchCtrlVO peSearchCtrlVO);
	
	List<PETopProduct> getMaxCompareYearRate(PESearchCtrlVO peSearchCtrlVO);
	
	List<PETopProduct> getMinCompareYearRate(PESearchCtrlVO peSearchCtrlVO);
	
}