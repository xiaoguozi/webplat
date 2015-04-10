package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.model.PEProductNet;

/**
 * 私募产品净值DAO
 * 
 *@Author zhsoft
 *@Time 2015年3月25日
 *
 **/
public interface PEProductNetMapper  {
	
	void insertPEProductNet(PEProductNet peProductNet);
	
	int deletePEProductNetById(long peProductNetId);
	
	void updatePEProductNet(PEProductNet peProductNet);
	
	List<PEProductNet> getPEProductNetList();
	
	int selectListCount();

	PEProductNet getPEProductNetById(long peProductNetId);
	
	
}