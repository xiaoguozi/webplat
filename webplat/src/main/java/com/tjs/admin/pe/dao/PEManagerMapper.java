package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.controller.PEManagerCtrlModel;
import com.tjs.admin.pe.model.PEManager;

/**
 * 私募经理DAO
 * 
 *@Author zhsoft
 *@Time 2015年4月21日
 *
 **/
public interface PEManagerMapper  {
	
	void insertPEManager(PEManager peManager);
	
	int deletePEManagerById(long peManagerId);
	
	void updatePEManager(PEManager peManager);
	
	List<PEManager> getPEManagerList(PEManagerCtrlModel peManagerCtrlModel);
	
	int selectListCount(PEManagerCtrlModel peManagerCtrlModel);

	PEManager getPEManagerById(long peManagerId);
		
	
}