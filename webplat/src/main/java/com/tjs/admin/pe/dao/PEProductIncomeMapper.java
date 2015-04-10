package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.model.PEProductIncome;

/**
 * 私募产品收益排名DAO
 * 
 *@Author zhsoft
 *@Time 2015年3月25日
 *
 **/
public interface PEProductIncomeMapper  {
	
	void insertPEProductIncome(PEProductIncome peProductIncome);
	
	int deletePEProductIncomeById(long peProductIncomeId);
	
	void updatePEProductIncome(PEProductIncome peProductIncome);
	
	List<PEProductIncome> getPEProductIncomeList();
	
	int selectListCount();

	PEProductIncome getPEProductIncomeById(long peProductIncomeId);
	
	
}