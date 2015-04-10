package com.tjs.admin.pe.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.pe.dao.PEProductIncomeMapper;
import com.tjs.admin.pe.model.PEProductIncome;
import com.tjs.admin.pe.service.PEProductIncomeService;
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
	public List<PEProductIncome> getPEProductIncomeList() {
		List<PEProductIncome> result = new ArrayList<PEProductIncome>();
		result = peProductIncomeMappper.getPEProductIncomeList();
		return result;
	}

	@Override
	public int selectListCount() {
		return peProductIncomeMappper.selectListCount();
	}

	@Override
	public PEProductIncome getPEProductIncomeById(long peProductIncomeId) {
		return peProductIncomeMappper.getPEProductIncomeById(peProductIncomeId);
	}
	
}
