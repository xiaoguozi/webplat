package com.tjs.admin.withdraw.service.impl;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.utils.BigDecimalUtils;
import com.tjs.admin.withdraw.service.IWithdrawBizService;
import com.tjs.admin.zhifu.controller.CustomerFundCtrlModel;
import com.tjs.admin.zhifu.exception.DuplicateException;
import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.admin.zhifu.model.FundRecord;
import com.tjs.admin.zhifu.model.Withdraw;
import com.tjs.admin.zhifu.service.ICustomerFund;
import com.tjs.admin.zhifu.service.IFundRecord;
import com.tjs.admin.zhifu.service.IWithdraw;
import com.tjs.admin.zhifu.zfenum.FundRecordFundTypeEnum;
import com.tjs.admin.zhifu.zfenum.WithdrawEnum;

@Service
public class WithdrawBizService implements IWithdrawBizService {
 
	 @Resource
	 IWithdraw withdrawService;
	 
	 @Resource
	 IFundRecord fundRecordService;
	 
	 @Resource
	 ICustomerFund customerFundService;
	 
	
	@Override
	public int updateWithdraw(Withdraw withdraw,String userName) {
		
		//是否已经提现完成
		Withdraw oldWithdraw= withdrawService.findByWithdrawId(withdraw.getWithrowId());
		if(WithdrawEnum.FINISH.getIntegerKey().equals(oldWithdraw.getStatus())){
			return 1;
		}
		
		
		
		
		
		//更新提现记录
		int iCount = withdrawService.updateWithdraw(withdraw);
		if(iCount==0){
			throw new DuplicateException("操作冲突");
		}
		
		//审批完成
		if(WithdrawEnum.FINISH.getIntegerKey().equals(withdraw.getStatus())){
		    //跟新个人账户信息
			CustomerFundCtrlModel customerFundCtrlModel = new CustomerFundCtrlModel();
			customerFundCtrlModel.getCustomerFund().setCustomerId(oldWithdraw.getCustomerId());
			List<CustomerFund> lstCustomerFund = customerFundService.selectCustomerFund(customerFundCtrlModel);
			CustomerFund customerFund = lstCustomerFund.get(0);
			customerFund.setDongjieFund(BigDecimalUtils.subtract(customerFund.getDongjieFund(), withdraw.getAmount()));
			customerFund.setTotalFund(BigDecimalUtils.subtract(customerFund.getTotalFund(), withdraw.getAmount()));
			customerFundService.updateCustomerFund(customerFund);
			
			//插入资金流水
			FundRecord fundRecord = new FundRecord();
			fundRecord.setAmount(withdraw.getAmount());
			fundRecord.setBusinessId(withdraw.getWithrowId());
			fundRecord.setCreateBy(oldWithdraw.getCreateBy());
			fundRecord.setCreateTime(Calendar.getInstance().getTime());
			fundRecord.setCustomerId(oldWithdraw.getCustomerId());
			fundRecord.setFundType(FundRecordFundTypeEnum.TXCG.getKey());
			fundRecord.setRecordDesc(FundRecordFundTypeEnum.TXCG.getValue());
			fundRecord.setUsableAmount(customerFund.getUsebleFund());			
		}	
		return 0;
	}

}
