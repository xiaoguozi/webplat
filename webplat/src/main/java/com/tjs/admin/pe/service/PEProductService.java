package com.tjs.admin.pe.service;

import java.util.List;
import java.util.Map;

import com.tjs.admin.pe.controller.PEProductCtrlModel;
import com.tjs.admin.pe.model.PECommonVO;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PETopProduct;
import com.tjs.web.pe.controller.PESearchCtrlVO;

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
	 * 依据公司ID获取上线的基金经理列表 
	 * 
	 * @return Map值 total：记录数， data：数据集
	 */
	List<PEManager> selectOnLinePEManager(Long companyId,String keyword);
	
	/**
	 * 得到私募首页顶级私募推荐
	 * @return PETopProduct 集合
	 */
	List<PETopProduct> getTop4PEProductList();
	
	/**
	 * 得到私募产品顶级私募推荐
	 * @return PETopProduct 集合
	 */
	List<PETopProduct> getTop4AnyPEProductList();
	
	/**
	 * 得到私募首页私募收益排行
	 * @param peSearchCtrlVO PESearchCtrlVO
	 * @return PETopProduct 集合
	 */
	List<PETopProduct> getTop10PEProductList(PESearchCtrlVO peSearchCtrlVO);
	
	/**
	 * 得到私募所有产品
	 * @param PESearchCtrlVO
	 * @return PETopProduct 集合
	 */
	List<PETopProduct> getAnyPEProductList(PESearchCtrlVO peSearchCtrlVO);
	
	/**
	 * 得到私募所有产品数量
	 * @param PESearchCtrlVO
	 * @return PETopProduct 集合
	 */
	int getAnyPEProductListCount(PESearchCtrlVO peSearchCtrlVO);
	
	/**
	 * 得到今年以来的所有年份
	 * @return PECommonVO集合
	 */
	List<PECommonVO> getYearAll();
	
	/**
	 * 依据产品ID设置产品是否代表作状态
	 * 
	 * @param peProduct
	 */
	void updatePEProductShow(PEProduct peProduct);
	
	/**
	 * 得到私募对比产品数量
	 * @param PESearchCtrlVO
	 * @return PETopProduct 集合
	 */
	int getRatePEProductListCount(PESearchCtrlVO peSearchCtrlVO);
	
	/**
	 * 得到私募对比所有产品
	 * @param PESearchCtrlVO
	 * @return PETopProduct 集合
	 */
	List<PETopProduct> getRatePEProductList(PESearchCtrlVO peSearchCtrlVO);
	
	/**
	 * 查询对比产品的每年收益
	 * @param productId
	 * @return
	 */
	List<PETopProduct> getCompareYearRate(PESearchCtrlVO peSearchCtrlVO, int yearCount);
	
	/**
	 * 查询对比产品的每年最低的收益
	 * @param productId
	 * @return
	 */
	List<PETopProduct> getMaxCompareYearRate(PESearchCtrlVO peSearchCtrlVO, int yearCount);
	
	/**
	 * 查询对比产品的每年最低的收益
	 * @param productId
	 * @return
	 */
	List<PETopProduct> getMinCompareYearRate(PESearchCtrlVO peSearchCtrlVO, int  yearCount);
	
	/**
    * 查询明星私募经理
    * @param peManagerCtrlModel
    * @return
    */
	List<PEProduct> selectStarPEProductIndex();   
	
	/**
	 * 微信个人中心查询私募
	 * @param peProductCtrlModel
	 * @return 数量
	 */
	int countOrderSimucp(PEProductCtrlModel peProductCtrlModel);
	
	/**
	 * 微信个人中心查询私募
	 * @param peProductCtrlModel
	 * @return
	 */
	List<PEProduct> selectOrderSimucp(PEProductCtrlModel peProductCtrlModel);
	
}
