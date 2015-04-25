package com.tjs.admin.pe.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.pe.controller.PEManagerCtrlModel;
import com.tjs.admin.pe.dao.PEManagerMapper;
import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.service.PEManagerService;
import com.tjs.core.util.DateUtils;

/**
 * 私募经理服务类
 * 
 *@author zhsoft
 *@since 2015年4月21日
 **/

@Service
public class PEManagerServiceImpl implements PEManagerService {
	
	@Resource
	private PEManagerMapper peManagerMapper;

	@Override
	public void insertPEManager(PEManager peManager) {
		peManager.setCreateDate(DateUtils.getCurrentDate());
		peManager.setLastModifyDate(DateUtils.getCurrentDate());
		peManagerMapper.insertPEManager(peManager);
	}

	@Override
	public int deletePEManager(long PEManagerId) {
		return 0;
	}

	@Override
	public void updatePEManager(PEManager peManager) {
		peManager.setLastModifyDate(DateUtils.getCurrentDate());
		peManagerMapper.updatePEManager(peManager);

	}

	@Override
	public List<PEManager> getPEManagerList() {
		List<PEManager> result = new ArrayList<PEManager>();
		result = peManagerMapper.getPEManagerList();
		return result;
	}

	@Override
	public int selectListCount() {
		return peManagerMapper.selectListCount();
	}

	@Override
	public PEManager getPEManagerById(long peManagerId) {
		return peManagerMapper.getPEManagerById(peManagerId);
	}

	@Override
	public void insertPEManager(PEManager peManager, PEManagerCtrlModel peManagerCtrlModel) {
		this.insertPEManager(peManager);
	}

	@Override
	public void updatePEManager(PEManager peManager, PEManagerCtrlModel peManagerCtrlModel) {
		this.updatePEManager(peManager);
	}

}
