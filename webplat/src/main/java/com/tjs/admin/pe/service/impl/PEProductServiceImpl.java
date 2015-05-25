package com.tjs.admin.pe.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.BigDecimalConverter;
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
	
	private static final BigDecimal BIGDECIMAL_ZERO = new BigDecimal("0");  
	
	
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

	@Override
	public List<PETopProduct> getCompareYearRate(PESearchCtrlVO peSearchCtrlVO, int yearCount) {
		List<PETopProduct> lstMaxRate = getMaxCompareYearRate(peSearchCtrlVO, yearCount);
		List<PETopProduct> lstMinRate = getMinCompareYearRate(peSearchCtrlVO, yearCount);
		
		List<PETopProduct> lstRate =new ArrayList<PETopProduct>(lstMaxRate.size());
		try {
			for(int i=0; i<lstMaxRate.size(); i++){
				PETopProduct newProduct = new PETopProduct();
				BigDecimalConverter bd = new BigDecimalConverter(BIGDECIMAL_ZERO);   
				ConvertUtils.register(bd, java.math.BigDecimal.class);    
				BeanUtils.copyProperties(newProduct, lstMaxRate.get(i));
				if(lstMaxRate.get(i).getNowRate()!=null){
					newProduct.setTimeRate(lstMaxRate.get(i).getNowRate().subtract(
							lstMinRate.get(i).getNowRate()==null?BIGDECIMAL_ZERO:lstMinRate.get(i).getNowRate()));
				}
				lstRate.add(newProduct);
			}
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		return lstRate;
	}

	@Override
	public List<PETopProduct> getMaxCompareYearRate(PESearchCtrlVO peSearchCtrlVO, int yearCount) {
		List<PECommonVO> lstCommonVO = new ArrayList<PECommonVO>();
		//年份
    	int currentYear = Calendar.getInstance().get(Calendar.YEAR);
    	for(int i=0; i<yearCount; i++){
    		PECommonVO c1 = new PECommonVO();
        	c1.setNetYear(String.valueOf(currentYear - i));
        	lstCommonVO.add(c1);
    	}
		
    	PETopProduct tempProduct = new PETopProduct();
		//peSearchCtrlVO.setPeProductId(peSearchCtrlVO.getPeProductId());
		List<PETopProduct> lstRateVO = peIndexMapper.getMaxCompareYearRate(peSearchCtrlVO);
		Map<String, PETopProduct> map = new HashMap<String, PETopProduct>();
		for(PETopProduct peVO : lstRateVO){
			map.put(peVO.getNetYear(), peVO);
		}
		//循环年份
		for(PECommonVO peCommonVO : lstCommonVO){
			if(map.get(peCommonVO.getNetYear())==null){
				PEProduct peProduct = null;
				if(lstRateVO.size()==0){
    				peProduct = getPEProductById(Long.valueOf(peSearchCtrlVO.getPeProductId()));
    				tempProduct.setId(Long.valueOf(peSearchCtrlVO.getPeProductId()));
    				tempProduct.setName(peProduct.getName());
    				tempProduct.setManagerId(String.valueOf(peProduct.getManagerId()));
    				tempProduct.setManagerName(peProduct.getManagerName());
    				PEManager peManager = peManagerService.getPEManagerById(peProduct.getManagerId());
    				tempProduct.setManageFund(peManager.getManageFund());
    			}else{
    				tempProduct.setId(lstRateVO.get(0).getId());
    				tempProduct.setName(lstRateVO.get(0).getName());
    				tempProduct.setManagerId(lstRateVO.get(0).getManagerId());
    				tempProduct.setManagerName(lstRateVO.get(0).getManagerName());
    				PEManager peManager = peManagerService.getPEManagerById(Long.valueOf(lstRateVO.get(0).getManagerId()));
    				tempProduct.setManageFund(peManager.getManageFund());
    			}
				lstRateVO.add(tempProduct);
			}
		}
		return lstRateVO;
	}

	@Override
	public List<PETopProduct> getMinCompareYearRate(PESearchCtrlVO peSearchCtrlVO, int yearCount) {
		List<PECommonVO> lstCommonVO = new ArrayList<PECommonVO>();
		
		//年份
    	int currentYear = Calendar.getInstance().get(Calendar.YEAR);
    	for(int i=0; i<yearCount; i++){
    		PECommonVO c1 = new PECommonVO();
        	c1.setNetYear(String.valueOf(currentYear - i));
        	lstCommonVO.add(c1);
    	}
		
    	PETopProduct tempProduct = new PETopProduct();
		//peSearchCtrlVO.setPeProductId(peSearchCtrlVO.getPeProductId());
		List<PETopProduct> lstRateVO = peIndexMapper.getMinCompareYearRate(peSearchCtrlVO);
		Map<String, PETopProduct> map = new HashMap<String, PETopProduct>();
		for(PETopProduct peVO : lstRateVO){
			map.put(peVO.getNetYear(), peVO);
		}
		//循环年份
		for(PECommonVO peCommonVO : lstCommonVO){
			if(map.get(peCommonVO.getNetYear())==null){
				PEProduct peProduct = null;
				if(lstRateVO.size()==0){
    				peProduct = getPEProductById(Long.valueOf(peSearchCtrlVO.getPeProductId()));
    				tempProduct.setId(Long.valueOf(peSearchCtrlVO.getPeProductId()));
    				tempProduct.setName(peProduct.getName());
    				tempProduct.setManagerId(String.valueOf(peProduct.getManagerId()));
    				tempProduct.setManagerName(peProduct.getManagerName());
    				PEManager peManager = peManagerService.getPEManagerById(peProduct.getManagerId());
    				tempProduct.setManageFund(peManager.getManageFund());
    			}else{
    				tempProduct.setId(lstRateVO.get(0).getId());
    				tempProduct.setName(lstRateVO.get(0).getName());
    				tempProduct.setManagerId(lstRateVO.get(0).getManagerId());
    				tempProduct.setManagerName(lstRateVO.get(0).getManagerName());
    				PEManager peManager = peManagerService.getPEManagerById(Long.valueOf(lstRateVO.get(0).getManagerId()));
    				tempProduct.setManageFund(peManager.getManageFund());
    			}
				lstRateVO.add(tempProduct);
			}
		}
		return lstRateVO;
	}
	
}
