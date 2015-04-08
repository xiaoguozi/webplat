package com.tjs.admin.pe.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.pe.dao.PEProductMapper;
import com.tjs.admin.pe.model.PECompany;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.service.PEProductService;

/**
 * 私募产品服务 
 * 
 *@author zhsoft
 *@since 2015年4月8日
 **/

@Service
public class PEProductServiceImpl implements PEProductService {

	@Resource
	PEProductMapper peProductMappper;
	
	@Override
	public int insertPEProduct(PEProduct peProduct) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePEProduct(long peProductId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePEProduct(PEProduct peProduct) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PEProduct> getPEProductList() {
		List<PEProduct> lstResult = new ArrayList<PEProduct>();
		lstResult = peProductMappper.getPEProductList();
		return lstResult;
	}

	@Override
	public Integer selectListCount() {
		return peProductMappper.selectListCount();
	}

	@Override
	public PEProduct getPEProductById(long peProductId) {
		// TODO Auto-generated method stub
		return null;
	}

}
