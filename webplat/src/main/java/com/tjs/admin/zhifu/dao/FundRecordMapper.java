package com.tjs.admin.zhifu.dao;

import java.util.List;

import com.tjs.admin.zhifu.controller.FundRecordCtrlModel;
import com.tjs.admin.zhifu.model.FundRecord;

public interface FundRecordMapper {	
	/**资金流水数量*/
    public int countFundRecord(FundRecordCtrlModel fundRecordCtrlModel);
    /**资金流水记录*/
    public List<FundRecord> selectFundRecord(FundRecordCtrlModel fundRecordCtrlModel);
    /**插入资金流水*/
	public int  insertFundRecord(FundRecord fundRecord);
	/**根据ID找到资金流水*/
	public FundRecord findByFundRecordId(Long recordId);
}
