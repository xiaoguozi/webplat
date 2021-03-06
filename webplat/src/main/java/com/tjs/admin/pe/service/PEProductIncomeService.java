package com.tjs.admin.pe.service;

import java.util.List;

import com.tjs.admin.pe.controller.PEProductIncomeCtrlModel;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PEProductIncome;

/**
 * 私募产品收益排名服务接口
 * 
 *@Author zhsoft
 *@Time 2015年3月26日
 **/
public interface PEProductIncomeService  {
	
	void insertPEProductIncome(PEProductIncome peProductIncome);
	
    int deletePEProductIncome(long peProductIncomeId);
	
	void updatePEProductIncome(PEProductIncome peProductIncome);
	
	List<PEProductIncome> getPEProductIncomeList(PEProductIncomeCtrlModel peProductIncomeCtrlModel);
	
	Integer selectListCount(PEProductIncomeCtrlModel peProductIncomeCtrlModel);
	
	PEProductIncome getPEProductIncomeById(long peProductIncomeId);
	
	PEProduct getPEProductById(PEProductIncomeCtrlModel peProductIncomeCtrlModel);
	
}
