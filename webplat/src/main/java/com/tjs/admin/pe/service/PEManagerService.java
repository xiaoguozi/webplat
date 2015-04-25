package com.tjs.admin.pe.service;

import java.util.List;

import com.tjs.admin.pe.controller.PEManagerCtrlModel;
import com.tjs.admin.pe.model.PEManager;

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
	
}
