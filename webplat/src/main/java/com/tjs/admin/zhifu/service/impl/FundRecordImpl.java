package com.tjs.admin.zhifu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.tjs.admin.zhifu.controller.FundRecordCtrlModel;
import com.tjs.admin.zhifu.dao.FundRecordMapper;
import com.tjs.admin.zhifu.model.FundRecord;
import com.tjs.admin.zhifu.service.IFundRecord;

public class FundRecordImpl implements IFundRecord{

	@Resource
	FundRecordMapper fundRecordMapper;
	
	@Override
	public int countFundRecord(FundRecordCtrlModel fundRecordCtrlModel) {
		// TODO Auto-generated method stub
		return fundRecordMapper.countFundRecord(fundRecordCtrlModel);
	}

	@Override
	public List<FundRecord> selectFundRecord(
			FundRecordCtrlModel fundRecordCtrlModel) {
		// TODO Auto-generated method stub
		return fundRecordMapper.selectFundRecord(fundRecordCtrlModel);
	}

	@Override
	public FundRecord insertFundRecord(FundRecord fundRecord) {
		// TODO Auto-generated method stub
		fundRecordMapper.insertFundRecord(fundRecord);
		return fundRecord;
	}

	@Override
	public FundRecord findByFundRecordId(Long recordId) {
		// TODO Auto-generated method stub
		return fundRecordMapper.findByFundRecordId(recordId);
	}

}
