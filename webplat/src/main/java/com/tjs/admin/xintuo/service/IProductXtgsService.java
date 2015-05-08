package com.tjs.admin.xintuo.service;

import java.util.List;

import com.tjs.admin.xintuo.controller.XinTuoGsCtrlModel;
import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.core.generic.GenericService;

/**
 * 信托产品接口类
 * @author Administrator
 *
 */
public interface IProductXtgsService  {
	
	public int countProductXtgs(XinTuoGsCtrlModel xintuoGsCtrlModel);
	
	public int insertProductXtgs(ProductXtgs productXtgs);
	
	public void updateProductXtgs(ProductXtgs productXtgs);
	
	public void deleteProductXtgs(Long xtgsId);
	
	public void deleteBatchProductXtgs(Long[] xtgsIds);
	
	public ProductXtgs findByProductXtgsId(Long xtgsId);
	
	public List<ProductXtgs> selectProductXtgs(XinTuoGsCtrlModel xintuoGsCtrlModel);
	/**查询信托公司上面四个*/
	public List<ProductXtgs> selectProductXtgsIndex();
}
