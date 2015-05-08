package com.tjs.admin.pe.service;

import java.util.List;
import java.util.Map;

import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PETopProduct;

/**
 * 私募产品服务接口
 * 
 *@Author zhsoft
 *@Time 2015年3月26日
 **/
public interface PEProductService  {
	
	int insertPEProduct(PEProduct peProduct);
	
    int deletePEProduct(long peProductId);
	
	int updatePEProduct(PEProduct peProduct);
	
	PEProduct getPEProductById(long peProductId);
	
    int insertPEProduct(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel);
	
	int updatePEProduct(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel);
	
    Integer selectListCount(PEProductCtrlModel peProductCtrlModel);
	
	List<PEProduct> getPEProductList(PEProductCtrlModel peProductCtrlModel);
	
	/**
	 * 获取上线的私募公司清单 
	 * 
	 * @return Map值 total：记录数， data：数据集
	 */
	Map<String, Object> getOnLinePECompanyList();
	
	/**
	 * 得到私募首页顶级私募推荐
	 * @param peProductCtrlModel
	 * @return PEProduct 集合
	 */
	List<PETopProduct> getTop4PEProductList();
	
	/**
	 * 得到私募首页私募收益排行
	 * @param peProductCtrlModel
	 * @return PEProduct 集合
	 */
	List<PETopProduct> getTop10PEProductList();
	
}
