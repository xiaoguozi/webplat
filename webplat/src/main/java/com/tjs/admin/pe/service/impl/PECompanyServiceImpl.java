package com.tjs.admin.pe.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.pe.dao.PECompanyMapper;
import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.service.PECompanyService;

/**
 * 私募公司服务实现
 * 
 *@Author zhsoft
 *@Time 2015年3月26日
 **/

@Service
public class PECompanyServiceImpl implements
		PECompanyService {
	
	@Resource
	private PECompanyMapper peCompanyMapper;
	
	@Override
	public int insertPECompany(PECompany peCompany) {
		int iResult = 0;
		iResult = peCompanyMapper.insertPECompany(peCompany);
		return iResult;
	}

	@Override
	public int deletePECompany(int peCompanyId) {
		int iResult = 0;
		iResult = peCompanyMapper.deletePECompany(peCompanyId);
		return iResult;
	}

	@Override
	public int updatePECompany(PECompany peCompany) {
		int iResult = 0;
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

}
