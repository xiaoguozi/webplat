package com.tjs.admin.pe.service;

import java.util.List;

import com.tjs.admin.pe.controller.PEProductNetCtrlModel;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.model.PEProductNet;

/**
 * 私募产品净值服务接口
 * 
 *@Author zhsoft
 *@Time 2015年3月26日
 **/
public interface PEProductNetService  {
	
	void insertPEProductNet(PEProductNet peProductNet);
	
    int deletePEProductNet(long peProductNetId);
	
	void updatePEProductNet(PEProductNet peProductNet);
	
	List<PEProductNet> getPEProductNetList(PEProductNetCtrlModel peProductNetCtrlModel);
	
	int selectListCount(PEProductNetCtrlModel peProductNetCtrlModel);
	
	PEProductNet getPEProductNetById(long peProductNetId);
	
	void insertPEProductNet(PEProductNet peProductNet, PEProductNetCtrlModel peProductNetCtrlModel);
	
	void updatePEProductNet(PEProductNet peProductNet, PEProductNetCtrlModel peProductNetCtrlModel);
	
	/**
	 * 通过产品ID获取产品实体
	 * 
	 * @param peProductNetCtrlModel
	 * @return 产品对象 
	 */
	PEProduct getPEProductById(PEProductNetCtrlModel peProductNetCtrlModel);
	
}
