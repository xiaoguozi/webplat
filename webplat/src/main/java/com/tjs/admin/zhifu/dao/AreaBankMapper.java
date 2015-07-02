package com.tjs.admin.zhifu.dao;

import java.util.List;

import com.tjs.admin.zhifu.model.Area;
import com.tjs.admin.zhifu.model.Bank;

public interface AreaBankMapper {
	public List<Area> selectAreaList(Area area);
	
	public List<Bank> selectBankList(String bankCode);
}
