package com.tjs.admin.pe.service;

import java.util.List;

import com.tjs.admin.pe.controller.PEProductNetCtrlModel;
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
	
	List<PEProductNet> getPEProductNetList();
	
	int selectListCount();
	
	PEProductNet getPEProductNetById(long peProductNetId);
	
	void insertPEProductNet(PEProductNet peProductNet, PEProductNetCtrlModel peProductNetCtrlModel);
	
	void updatePEProductNet(PEProductNet peProductNet, PEProductNetCtrlModel peProductNetCtrlModel);
	
}
