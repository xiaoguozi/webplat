package com.tjs.web.zhifu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.admin.zhifu.model.FundRecord;
import com.tjs.admin.zhifu.model.Recharge;
import com.tjs.admin.zhifu.model.Withdraw;
import com.tjs.admin.zhifu.service.ICustomerFund;
import com.tjs.admin.zhifu.service.IFundRecord;
import com.tjs.admin.zhifu.service.IRecharge;
import com.tjs.admin.zhifu.service.IWithdraw;
import com.tjs.web.zhifu.service.IZhifuService;

@Service
public class ZhifuService implements IZhifuService {
	
	@Resource
	private IRecharge rechargeService;
	
	@Resource
	private IFundRecord fundRecordService;
	
	@Resource
	private ICustomerFund customerFundService;
	
	@Resource
	private IWithdraw withdrawService;

	@Override
	public void callbackUpdate(Recharge recharge, FundRecord fundRecord, CustomerFund customerFund) {		
		int updateCount = rechargeService.updateRecharge(recharge);
		if(updateCount==1){
			fundRecordService.insertFundRecord(fundRecord);
			customerFundService.updateCustomerFund(customerFund);
		}else{
			//do nothing
			//throw new RuntimeException("充值已经更新");
		}
		
	}

	@Override
	public void withdraw(Withdraw withdraw, FundRecord fundRecord,
			CustomerFund customerFund) {
		withdrawService.insertWithdraw(withdraw);
		fundRecordService.insertFundRecord(fundRecord);
		customerFundService.updateCustomerFund(customerFund);
	}

}
