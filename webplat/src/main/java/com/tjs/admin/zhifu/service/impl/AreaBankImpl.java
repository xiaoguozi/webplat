package com.tjs.admin.zhifu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.zhifu.dao.AreaBankMapper;
import com.tjs.admin.zhifu.model.Area;
import com.tjs.admin.zhifu.model.Bank;
import com.tjs.admin.zhifu.service.IAreaBank;
@Service
public class AreaBankImpl implements IAreaBank {
	
	@Resource
	AreaBankMapper areaMapper;
	
	
	@Override
	public List<Area> selectAreaList(Area area) {
		// TODO Auto-generated method stub
		return areaMapper.selectAreaList(area);
	}


	@Override
	public List<Bank> selectBankList(String bankCode) {
		// TODO Auto-generated method stub
		return areaMapper.selectBankList(bankCode);
	}

}
