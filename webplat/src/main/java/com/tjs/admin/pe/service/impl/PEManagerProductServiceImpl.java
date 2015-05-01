package com.tjs.admin.pe.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.pe.dao.PEManagerProductMapper;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEManagerProduct;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.service.PEManagerProductService;

/**
 *@author zhsoft
 *@since 2015年4月30日
 **/
@Service
public class PEManagerProductServiceImpl implements PEManagerProductService {
	
	@Resource
	PEManagerProductMapper peManagerProductMapper;

	@Override
	public void insert(List<PEManagerProduct> managerProducts) {
		peManagerProductMapper.insert(managerProducts);
	}

	@Override
	public int insert(PEManager peManager, List<PEProduct> products) {
		
		int result = 1;
		
		if (peManager == null || (products == null || products.size() == 0)) {
			result = 0;
			return result;
		}
		
		List<PEManagerProduct> managerProducts = new ArrayList<PEManagerProduct>();
		
		for (PEProduct product : products) {
			PEManagerProduct peManagerProduct = new PEManagerProduct();
			peManagerProduct.setCompanyId(peManager.getCompanyId());
			peManagerProduct.setCompanyName(peManager.getCompanyName());
			peManagerProduct.setManagerId(peManager.getId());
			peManagerProduct.setManagerName(peManager.getName());
			peManagerProduct.setProductId(product.getId());
			peManagerProduct.setProductName(product.getName());
			managerProducts.add(peManagerProduct);
		}
		
		this.insert(managerProducts);
		return result;
	}

}
