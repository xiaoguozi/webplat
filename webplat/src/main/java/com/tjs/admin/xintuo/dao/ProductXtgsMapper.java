package com.tjs.admin.xintuo.dao;

import java.util.List;

import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.core.generic.GenericDao;

/**
 * 数据库操作接口类
 * @author Administrator
 *
 */
public interface ProductXtgsMapper  extends GenericDao<ProductXtgs, Long> {
  	
	public int countProductXtgs(ProductXtgs productXtgs);
	
	public int  insertProductXtgs(ProductXtgs productXtgs);
	
	public int updateProductXtgs(ProductXtgs productXtgs);
	
	public void deleteProductXtgs(Long xtgsId);
	
	public void deleteBatchProductXtgs(Long[] xtgsIds);
	
	public ProductXtgs findByProductXtgsId(Long xtgsId);
	
	public List<ProductXtgs> selectProductXtgs();
		
}


