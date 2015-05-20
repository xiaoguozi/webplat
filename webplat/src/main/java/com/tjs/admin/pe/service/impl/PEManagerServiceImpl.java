package com.tjs.admin.pe.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.pe.controller.PECompanyCtrlModel;
import com.tjs.admin.pe.controller.PEManagerCtrlModel;
import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.dao.PEManagerMapper;
import com.tjs.admin.pe.model.Lable;
import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.service.PECompanyService;
import com.tjs.admin.pe.service.PEManagerService;
import com.tjs.admin.pe.service.PEProductService;
import com.tjs.admin.pe.util.StatusEnum;
import com.tjs.core.util.DateUtils;

/**
 * 私募经理服务类
 * 
 *@author zhsoft
 *@since 2015年4月21日
 **/

@Service
public class PEManagerServiceImpl implements PEManagerService {
	
	@Resource
	private PEManagerMapper peManagerMapper;
	
	@Resource
	private PECompanyService peCompanyService;
	
	@Resource
	private PEProductService peProductService;

	@Override
	public void insertPEManager(PEManager peManager) {
		peManager.setCreateDate(DateUtils.getCurrentDate());
		peManager.setLastModifyDate(DateUtils.getCurrentDate());
		peManagerMapper.insertPEManager(peManager);
	}

	@Override
	public int deletePEManager(long PEManagerId) {
		return 0;
	}

	@Override
	public void updatePEManager(PEManager peManager) {
		peManager.setLastModifyDate(DateUtils.getCurrentDate());
		peManagerMapper.updatePEManager(peManager);

	}

	@Override
	public List<PEManager> getPEManagerList(PEManagerCtrlModel peManagerCtrlModel) {
		List<PEManager> result = new ArrayList<PEManager>();
		result = peManagerMapper.getPEManagerList(peManagerCtrlModel);
		return result;
	}

	@Override
	public int selectListCount(PEManagerCtrlModel newParampeManagerCtrlModel) {
		return peManagerMapper.selectListCount(newParampeManagerCtrlModel);
	}

	@Override
	public PEManager getPEManagerById(long peManagerId) {
		return peManagerMapper.getPEManagerById(peManagerId);
	}

	@Override
	public void insertPEManager(PEManager peManager, PEManagerCtrlModel peManagerCtrlModel) {
		PECompany peCompany = peCompanyService.getPECompanyById(peManager.getCompanyId());
		peManager.setCompanyName(peCompany.getName());
		this.insertPEManager(peManager);
	}

	@Override
	public void updatePEManager(PEManager peManager, PEManagerCtrlModel peManagerCtrlModel) {
		this.updatePEManager(peManager);
	}

	@Override
	public Map<String, Object> getOnLinePECompanyList() {
		return peCompanyService.getOnLinePECompany();
	}

	@Override
	public List<PEProduct> getOnLinePEProductList(PEManager peManager) {
		List<PEProduct> result = new ArrayList<PEProduct>();
		
		PEProduct peProduct = new PEProduct();
		peProduct.setPecompanyId(peManager.getCompanyId());
		peProduct.setStatus(StatusEnum.ON_LINE.getStatus());
		
		PEProductCtrlModel peProductCtrlModel = new PEProductCtrlModel();
		peProductCtrlModel.setPeProduct(peProduct);
		result =  peProductService.getPEProductList(peProductCtrlModel);
		return result;
	}
	
	
	@Override
	public Map<String, Object> getOnLinePEManagerByCompanyId(Long companyId) {
		Map<String, Object> result = new HashMap<String, Object>();
		PEManagerCtrlModel peManagerCtrlModel = new PEManagerCtrlModel();
		PEManager peManager = new PEManager();
		peManager.setStatus(StatusEnum.ON_LINE.getStatus());
		peManager.setCompanyId(companyId);
		peManagerCtrlModel.setPeManager(peManager);
		
		int count = this.selectListCount(peManagerCtrlModel);
		List<PEManager> managers = this.getPEManagerList(peManagerCtrlModel);
		List<Lable> lables = new ArrayList<Lable>();
		for(PEManager manager : managers) {
			Lable lable = new Lable();
			lable.setId(String.valueOf(manager.getId()));
			lable.setTitle(manager.getName());
			lables.add(lable);
		}
					
		result.put("total", count);
    	result.put("data", lables); 
		return result;
	}

}
