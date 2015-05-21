package com.tjs.admin.pe.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.dao.PEIndexMapper;
import com.tjs.admin.pe.dao.PEProductMapper;
import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PETopProduct;
import com.tjs.admin.pe.service.PECompanyService;
import com.tjs.admin.pe.service.PEManagerService;
import com.tjs.admin.pe.service.PEProductService;
import com.tjs.admin.pe.util.ShowEnum;
import com.tjs.core.util.DateUtils;
import com.tjs.web.pe.controller.PESearchCtrlVO;
import com.tjs.admin.pe.model.PECommonVO;

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
	
	@Resource
	private PEIndexMapper peIndexMapper;
	
	@Resource
	private PEManagerService peManagerService;
	
	
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
		PEManager peManager = peManagerService.getPEManagerById(peProduct.getManagerId());
		peProduct.setManagerName(peManager.getName());
		// PECompany peCompany = peCompanyService.getPECompanyById(peProduct.getPecompanyId());
		peProduct.setPecompanyName(peManager.getCompanyName());
		peProduct.setPecompanyId(peManager.getCompanyId());
		result = this.insertPEProduct(peProduct);
		return result;
	}

	@Override
	public int updatePEProduct(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel) {
		int result = 0;
		str2Date(peProduct, peProductCtrlModel);
		peProduct.setLastModifyDate(DateUtils.getCurrentDate());
		PEManager peManager = peManagerService.getPEManagerById(peProduct.getManagerId());
		peProduct.setManagerName(peManager.getName());
		// PECompany peCompany = peCompanyService.getPECompanyById(peProduct.getPecompanyId());
		peProduct.setPecompanyName(peManager.getCompanyName());
		peProduct.setPecompanyId(peManager.getCompanyId());
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

	@Override
	public List<PETopProduct> getTop4PEProductList() {
		List<PETopProduct> result = new ArrayList<PETopProduct>();
		result = peIndexMapper.getTop4PEProductList();
		return result;
	}
	
	@Override
	public List<PETopProduct> getTop4AnyPEProductList() {
		List<PETopProduct> result = new ArrayList<PETopProduct>();
		result = peIndexMapper.getTop4AnyPEProductList();
		return result;
	}

	@Override
	public List<PETopProduct> getTop10PEProductList(PESearchCtrlVO peSearchCtrlVO) {
		List<PETopProduct> result = new ArrayList<PETopProduct>();
		result = peIndexMapper.getTop10PEProductList(peSearchCtrlVO);
		return result;
	}
	
	@Override
	public List<PETopProduct> getAnyPEProductList(PESearchCtrlVO peSearchCtrlVO) {
		List<PETopProduct> result = new ArrayList<PETopProduct>();
		result = peIndexMapper.getAnyPEProductList(peSearchCtrlVO);
		return result;
	}

	@Override
	public int getAnyPEProductListCount(PESearchCtrlVO peSearchCtrlVO) {
		int count = peIndexMapper.getAnyPEProductListCount(peSearchCtrlVO);
		return count;
	}

	@Override
	public List<PEManager> selectOnLinePEManager(Long companyId,String keyword) {		
		return peManagerService.selectOnLinePEManager(companyId,keyword);				
	}
	
	@Override
	public List<PECommonVO> getYearAll() {
		List<PECommonVO> lstYear = peIndexMapper.getYearAll();
		return lstYear;
	}

	@Override
	public void updatePEProductShow(PEProduct peProduct) {
		
		peProduct.setIsShow(ShowEnum.SHOW.getStatus());
		List<PEProduct> products = peProductMappper.getPEProductShow(peProduct);
		
		for (PEProduct product : products) {
			product.setIsShow(ShowEnum.ON_SHOW.getStatus());
			peProductMappper.updatePEProduct(product);
		}
		
		
		peProductMappper.updatePEProductShow(peProduct);
	}
	
	@Override
	public int getRatePEProductListCount(PESearchCtrlVO peSearchCtrlVO) {
		int count = peIndexMapper.getRatePEProductListCount(peSearchCtrlVO);
		return count;
	}

	@Override
	public List<PETopProduct> getRatePEProductList(PESearchCtrlVO peSearchCtrlVO) {
		List<PETopProduct> result = new ArrayList<PETopProduct>();
		result = peIndexMapper.getRatePEProductList(peSearchCtrlVO);
		return result;
	}
	
}
