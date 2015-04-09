package com.tjs.admin.xintuo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.xintuo.controller.XinTuoGsCtrlModel;
import com.tjs.admin.xintuo.dao.ProductXtgsMapper;
import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.admin.xintuo.service.IProductXtgsService;

@Service
public class ProductXtgsServiceImpl  implements IProductXtgsService {

	@Resource
    private ProductXtgsMapper productXtgsMapper;
		
	@Override
	public int countProductXtgs(XinTuoGsCtrlModel xinTuoGsCtrlModel) {
		return productXtgsMapper.countProductXtgs(xinTuoGsCtrlModel);
	}

	@Override
	public int  insertProductXtgs(ProductXtgs productXtgs) {
		return productXtgsMapper.insertProductXtgs(productXtgs);
		 
	}
	
	@Override
	public void updateProductXtgs(ProductXtgs productXtgs) {
		productXtgsMapper.updateProductXtgs(productXtgs);
	}





	@Override
	public void deleteProductXtgs(Long xtgsId) {
		productXtgsMapper.deleteProductXtgs(xtgsId);
	}





	@Override
	public ProductXtgs findByProductXtgsId(Long xtgsId) {
		return productXtgsMapper.findByProductXtgsId(xtgsId);
	}
	
	
	
	@Override
	public void deleteBatchProductXtgs(Long[] xtgsIds) {
		productXtgsMapper.deleteBatchProductXtgs(xtgsIds);
		
	}

	@Override
	public List<ProductXtgs> selectProductXtgs(XinTuoGsCtrlModel xintuoGsCtrlModel) {
		return productXtgsMapper.selectProductXtgs(xintuoGsCtrlModel);
	}


}
