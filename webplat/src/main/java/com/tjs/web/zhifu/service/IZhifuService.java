package com.tjs.web.zhifu.service;

import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.admin.zhifu.model.FundRecord;
import com.tjs.admin.zhifu.model.Recharge;

public interface IZhifuService {

	/**
	 * 回调更新
	 * @param recharge
	 * @param fundRecord
	 */
	void callbackUpdate(Recharge recharge, FundRecord fundRecord, CustomerFund customerFund);
	
}
