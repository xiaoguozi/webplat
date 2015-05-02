package com.tjs.admin.pe.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.pe.controller.PEProductIncomeCtrlModel;
import com.tjs.admin.pe.dao.PEProductIncomeMapper;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PEProductIncome;
import com.tjs.admin.pe.service.PEProductIncomeService;
import com.tjs.admin.pe.service.PEProductService;
import com.tjs.core.util.DateUtils;

/**
 * 私募产品收益排名服务 
 * 
 *@author zhsoft
 *@since 2015年4月8日
 **/

@Service
public class PEProductIncomeServiceImpl implements PEProductIncomeService {

	@Resource
	private PEProductIncomeMapper peProductIncomeMappper;
	
	@Resource 
	private PEProductService peProductService;

	@Override
	public void insertPEProductIncome(PEProductIncome peProductIncome) {
		peProductIncome.setCreateDate(DateUtils.getCurrentDate());
		peProductIncome.setLastModifyDate(DateUtils.getCurrentDate());
		peProductIncomeMappper.insertPEProductIncome(peProductIncome);
	}

	@Override
	public int deletePEProductIncome(long peProductIncomeId) {
		return 0;
	}

	@Override
	public void updatePEProductIncome(PEProductIncome peProductIncome) {
		peProductIncome.setLastModifyDate(DateUtils.getCurrentDate());
		peProductIncomeMappper.updatePEProductIncome(peProductIncome);
	}

	@Override
	public List<PEProductIncome> getPEProductIncomeList(PEProductIncomeCtrlModel peProductIncomeCtrlModel) {
		List<PEProductIncome> result = new ArrayList<PEProductIncome>();
		result = peProductIncomeMappper.getPEProductIncomeList(peProductIncomeCtrlModel);
		return result;
	}

	@Override
	public Integer selectListCount(PEProductIncomeCtrlModel peProductIncomeCtrlModel) {
		return peProductIncomeMappper.selectListCount(peProductIncomeCtrlModel);
	}

	@Override
	public PEProductIncome getPEProductIncomeById(long peProductIncomeId) {
		return peProductIncomeMappper.getPEProductIncomeById(peProductIncomeId);
	}
	
	
	public PEProduct getPEProductById(PEProductIncomeCtrlModel peProductIncomeCtrlModel) {
		long productId = Long.valueOf(peProductIncomeCtrlModel.getProductId()).longValue();
		return peProductService.getPEProductById(productId);
	}
}
