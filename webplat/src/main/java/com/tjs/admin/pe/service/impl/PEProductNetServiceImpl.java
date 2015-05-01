package com.tjs.admin.pe.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.pe.controller.PEProductNetCtrlModel;
import com.tjs.admin.pe.dao.PEProductNetMapper;
import com.tjs.admin.pe.model.PEProductNet;
import com.tjs.admin.pe.service.PEProductNetService;
import com.tjs.core.util.DateUtils;

/**
 * 私募产品净值服务类
 * 
 *@author zhsoft
 *@since 2015年4月10日
 **/

@Service
public class PEProductNetServiceImpl implements PEProductNetService {
	
	@Resource
	private PEProductNetMapper peProductNetMapper;

	@Override
	public void insertPEProductNet(PEProductNet peProductNet) {
		peProductNet.setCreateDate(DateUtils.getCurrentDate());
		peProductNet.setLastModifyDate(DateUtils.getCurrentDate());
		peProductNetMapper.insertPEProductNet(peProductNet);
	}

	@Override
	public int deletePEProductNet(long peProductNetId) {
		return 0;
	}

	@Override
	public void updatePEProductNet(PEProductNet peProductNet) {
		peProductNet.setLastModifyDate(DateUtils.getCurrentDate());
		peProductNetMapper.updatePEProductNet(peProductNet);

	}

	@Override
	public List<PEProductNet> getPEProductNetList(PEProductNetCtrlModel peProductNetCtrlModel) {
		List<PEProductNet> result = new ArrayList<PEProductNet>();
		result = peProductNetMapper.getPEProductNetList(peProductNetCtrlModel);
		return result;
	}

	@Override
	public int selectListCount(PEProductNetCtrlModel peProductNetCtrlModel) {
		return peProductNetMapper.selectListCount(peProductNetCtrlModel);
	}

	@Override
	public PEProductNet getPEProductNetById(long peProductNetId) {
		return peProductNetMapper.getPEProductNetById(peProductNetId);
	}

	@Override
	public void insertPEProductNet(PEProductNet peProductNet, PEProductNetCtrlModel peProductNetCtrlModel) {
		Date netTime = DateUtils.str2Date(peProductNetCtrlModel.getNetTimeStr());
		peProductNet.setNetTime(netTime);
		this.insertPEProductNet(peProductNet);
	}

	@Override
	public void updatePEProductNet(PEProductNet peProductNet, PEProductNetCtrlModel peProductNetCtrlModel) {
		Date netTime = DateUtils.str2Date(peProductNetCtrlModel.getNetTimeStr());
		peProductNet.setNetTime(netTime);
		this.updatePEProductNet(peProductNet);
	}

}
