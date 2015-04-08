package com.tjs.admin.pe.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.pe.controller.PECompanyCtrlModel;
import com.tjs.admin.pe.dao.PECompanyMapper;
import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.service.PECompanyService;
import com.tjs.core.util.DateUtils;

/**
 * 私募公司服务实现
 * 
 *@Author zhsoft
 *@Time 2015年3月26日
 **/

@Service
public class PECompanyServiceImpl implements PECompanyService {
	
	@Resource
	private PECompanyMapper peCompanyMapper;
	
	@Override
	public int insertPECompany(PECompany peCompany) {
		int iResult = 0;
		peCompany.setCreateDate(DateUtils.getCurrentDate());
		peCompany.setLastModifyDate(DateUtils.getCurrentDate());
		iResult = peCompanyMapper.insertPECompany(peCompany);
		return iResult;
	}

	@Override
	public int deletePECompany(long peCompanyId) {
		int iResult = 0;
		iResult = peCompanyMapper.deletePECompany(peCompanyId);
		return iResult;
	}

	@Override
	public int updatePECompany(PECompany peCompany) {
		int iResult = 0;
		peCompany.setLastModifyDate(DateUtils.getCurrentDate());
		iResult = peCompanyMapper.updatePECompany(peCompany);
		return iResult;
	}

	@Override
	public List<PECompany> getPECompanyList() {
		List<PECompany> lstResult = new ArrayList<PECompany>();
		lstResult = peCompanyMapper.getPECompanyList();
		return lstResult;
	}

	@Override
	public Integer selectListCount() {
		return peCompanyMapper.selectListCount();
	}

	@Override
	public PECompany getPECompanyById(long peCompanyId) {
		PECompany result = null;
		result = peCompanyMapper.getPECompanyById(peCompanyId);     
		return result;
	}

	@Override
	public int updatePECompany(PECompany peCompany, PECompanyCtrlModel peCompanyCtrlModel) {
		int result = 0;
		
		Date setupTime = DateUtils.str2Date(peCompanyCtrlModel.getSetupTimeStr());
		peCompany.setSetupTime(setupTime);
		result = updatePECompany(peCompany);
		
		return result;
	}

	@Override
	public int insertPECompany(PECompany peCompany,	PECompanyCtrlModel peCompanyCtrlModel) {
		int result = 0;
		Date setupTime = DateUtils.str2Date(peCompanyCtrlModel.getSetupTimeStr());
		peCompany.setSetupTime(setupTime);
		result = this.insertPECompany(peCompany);
		return result;
	}

	@Override
	public int deleteBatchPECompany(long[] ids) {
		int result = 0;
		
		peCompanyMapper.deleteBatchPECompany(ids);
		
		return result;
	}

}
