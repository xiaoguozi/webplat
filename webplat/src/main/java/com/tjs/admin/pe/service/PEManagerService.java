package com.tjs.admin.pe.service;

import java.util.List;
import java.util.Map;

import com.tjs.admin.pe.controller.PEManagerCtrlModel;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEProduct;

/**
 * 私募经理服务接口
 * 
 *@Author zhsoft
 *@Time 2015年4月21日
 **/
public interface PEManagerService  {
	
	void insertPEManager(PEManager peManager);
	
    int deletePEManager(long peManagerId);
	
	void updatePEManager(PEManager peManager);
	
	List<PEManager> getPEManagerList();
	
	int selectListCount();
	
	PEManager getPEManagerById(long peManagerId);
	
	void insertPEManager(PEManager peManager, PEManagerCtrlModel peManagerCtrlModel);
	
	void updatePEManager(PEManager peManager, PEManagerCtrlModel peManagerCtrlModel);
	
	/**
	 * 获取上线的私募公司清单 
	 * 
	 * @return Map值 total：记录数， data：数据集
	 */
	Map<String, Object> getOnLinePECompanyList();
	
	/**
	 * 获取对应私募公司在线的产品清单 
	 * 
	 * @param peManager
	 * @return 产品清单列表
	 */
	List<PEProduct> getOnLinePEProductList(PEManager peManager); 
}