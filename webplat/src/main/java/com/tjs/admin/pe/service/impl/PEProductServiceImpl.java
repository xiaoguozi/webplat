package com.tjs.admin.pe.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.dao.PEProductMapper;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.service.PECompanyService;
import com.tjs.admin.pe.service.PEProductService;
import com.tjs.core.util.DateUtils;

/**
 * 私募产品服务 
 * 
 *@author zhsoft
 *@since 2015年4月8日
 **/

@Service
public class PEProductServiceImpl implements PEProductService {

	@Resource
	private PEProductMapper peProductMappper;
	
	@Resource
	private PECompanyService peCompanyService;
	
	@Override
	public int insertPEProduct(PEProduct peProduct) {
		int result = 0;
		peProduct.setCreateDate(DateUtils.getCurrentDate());
		peProduct.setLastModifyDate(DateUtils.getCurrentDate());
		result = peProductMappper.insertPEProduct(peProduct);
		return result;
	}

	@Override
	public int deletePEProduct(long peProductId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePEProduct(PEProduct peProduct) {
		int result = 0;
		result = peProductMappper.updatePEProduct(peProduct);
		return result;
	}

	@Override
	public PEProduct getPEProductById(long peProductId) {
		return peProductMappper.getPEProductById(peProductId);
	}

	@Override
	public int insertPEProduct(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel) {
		int result = 0;
		str2Date(peProduct, peProductCtrlModel);
		result = this.insertPEProduct(peProduct);
		return result;
	}

	@Override
	public int updatePEProduct(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel) {
		int result = 0;
		str2Date(peProduct, peProductCtrlModel);
		peProduct.setLastModifyDate(DateUtils.getCurrentDate());
		result = this.updatePEProduct(peProduct);
		return result;
	}

	
	private void str2Date(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel) {
		Date netWorthTime = DateUtils.str2Date(peProductCtrlModel.getNetWorthTimeStr());
		Date setupTime = DateUtils.str2Date(peProductCtrlModel.getSetupTimeStr());
		Date openTime = DateUtils.str2Date(peProductCtrlModel.getOpenTimeStr());
		peProduct.setNetWorthTime(netWorthTime);
		peProduct.setSetupTime(setupTime);
		peProduct.setOpenTime(openTime);
	}

	@Override
	public Map<String, Object> getOnLinePECompanyList() {
		return peCompanyService.getOnLinePECompany();
	}

	@Override
	public Integer selectListCount(PEProductCtrlModel peProductCtrlModel) {
		int result = 0;
		result = peProductMappper.selectListCount(peProductCtrlModel);
		return result;
	}

	@Override
	public List<PEProduct> getPEProductList(PEProductCtrlModel peProductCtrlModel) {
		List<PEProduct> result = new ArrayList<PEProduct>();
		result = peProductMappper.getPEProductList(peProductCtrlModel);
		return result;
	}

	
}
