package com.tjs.web.zhifu.service;

import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.admin.zhifu.model.FundRecord;
import com.tjs.admin.zhifu.model.Recharge;
import com.tjs.admin.zhifu.model.Withdraw;

public interface IZhifuService {

	/**
	 * 回调更新
	 * @param recharge
	 * @param fundRecord
	 */
	void callbackUpdate(Recharge recharge, FundRecord fundRecord, CustomerFund customerFund);
	
	/**
	 * 提现
	 * @param withdraw
	 * @param fundRecord
	 * @param customerFund
	 */
	void withdraw(Withdraw withdraw, FundRecord fundRecord, CustomerFund customerFund);
	
}
