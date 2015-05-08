package com.tjs.admin.xintuo.dao;

import java.util.List;

import com.tjs.admin.xintuo.controller.XinTuoGsCtrlModel;
import com.tjs.admin.xintuo.model.ProductXtgs;

/**
 * 数据库操作接口类
 * @author Administrator
 *
 */
public interface ProductXtgsMapper  {
  	
	public int countProductXtgs(XinTuoGsCtrlModel xinTuoGsCtrlModel);
	
	public int  insertProductXtgs(ProductXtgs productXtgs);
	
	public int updateProductXtgs(ProductXtgs productXtgs);
	
	public void deleteProductXtgs(Long xtgsId);
	
	public void deleteBatchProductXtgs(Long[] xtgsIds);
	
	public ProductXtgs findByProductXtgsId(Long xtgsId);
	
	public List<ProductXtgs> selectProductXtgs(XinTuoGsCtrlModel xinTuoGsCtrlModel );
	
	public List<ProductXtgs> selectProductXtgsIndex();
		
}


