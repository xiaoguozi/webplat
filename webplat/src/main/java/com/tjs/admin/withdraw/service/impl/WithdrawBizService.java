package com.tjs.admin.withdraw.service.impl;

import java.util.Calendar;
import java.util.Date;
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
		if(WithdrawEnum.FINISH.getIntegerKey().equals(oldWithdraw.getStatus())||
		 WithdrawEnum.CANCEL.getIntegerKey().equals(oldWithdraw.getStatus())){
			return 1;
		}
		
		if(WithdrawEnum.DSH.getIntegerKey().equals(withdraw.getStatus())){
			withdraw.setStatus(WithdrawEnum.DYD.getIntegerKey());
			withdraw.setAuditBy(userName);
			withdraw.setAuditTime(new Date());
		}else if(WithdrawEnum.DYD.getIntegerKey().equals(withdraw.getStatus())){
			withdraw.setAuditBy(oldWithdraw.getAuditBy());
			withdraw.setAuditTime(oldWithdraw.getAuditTime());
			withdraw.setStatus(WithdrawEnum.FINISH.getIntegerKey());
			withdraw.setCheckBy(userName);
			withdraw.setCheckTime(new Date());;
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
			int iUpdateCount = customerFundService.updateCustomerFund(customerFund);
			
			if(iUpdateCount==0){
				throw new DuplicateException("操作冲突");
			}
			
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
			fundRecordService.insertFundRecord(fundRecord);
		}	
		return 0;
	}


	@Override
	public int cancelWithdraw(Withdraw withdraw, String userName) {
		//是否已经提现完成
		Withdraw oldWithdraw= withdrawService.findByWithdrawId(withdraw.getWithrowId());
		if(WithdrawEnum.FINISH.getIntegerKey().equals(oldWithdraw.getStatus())){
			return 1;
		}
		
		if(WithdrawEnum.DSH.getIntegerKey().equals(withdraw.getStatus())){
			withdraw.setStatus(WithdrawEnum.CANCEL.getIntegerKey());
			withdraw.setAuditBy(userName);
			withdraw.setAuditTime(new Date());
		}else if(WithdrawEnum.DYD.getIntegerKey().equals(withdraw.getStatus())){
			withdraw.setAuditBy(oldWithdraw.getAuditBy());
			withdraw.setAuditTime(oldWithdraw.getAuditTime());
			withdraw.setStatus(WithdrawEnum.CANCEL.getIntegerKey());
			withdraw.setCheckBy(userName);
			withdraw.setCheckTime(new Date());;
		}
		
		//更新提现记录
		int iCount = withdrawService.updateWithdraw(withdraw);
		if(iCount==0){
			throw new DuplicateException("操作冲突");
		}
		
							
	    //更新个人账户信息
		CustomerFundCtrlModel customerFundCtrlModel = new CustomerFundCtrlModel();
		customerFundCtrlModel.getCustomerFund().setCustomerId(oldWithdraw.getCustomerId());
		List<CustomerFund> lstCustomerFund = customerFundService.selectCustomerFund(customerFundCtrlModel);
		CustomerFund customerFund = lstCustomerFund.get(0);
		//个人总资产不用加，因为在提先申请的时候，是从可以金额变为冻结金额，取消的时候就只处理这两个字段
		customerFund.setDongjieFund(BigDecimalUtils.subtract(customerFund.getDongjieFund(), oldWithdraw.getAmount()));
		customerFund.setUsebleFund(BigDecimalUtils.add(customerFund.getUsebleFund(), oldWithdraw.getAmount()));
		int iUpdateCount = customerFundService.updateCustomerFund(customerFund);
		
		if(iUpdateCount==0){
			throw new DuplicateException("操作冲突");
		}
		
		//插入资金流水
		FundRecord fundRecord = new FundRecord();
		fundRecord.setAmount(oldWithdraw.getAmount());
		fundRecord.setBusinessId(oldWithdraw.getWithrowId());
		fundRecord.setCreateBy(oldWithdraw.getCreateBy());
		fundRecord.setCreateTime(Calendar.getInstance().getTime());
		fundRecord.setCustomerId(oldWithdraw.getCustomerId());
		fundRecord.setFundType(FundRecordFundTypeEnum.TXSB.getKey());
		fundRecord.setRecordDesc(FundRecordFundTypeEnum.TXSB.getValue());
		fundRecord.setUsableAmount(customerFund.getUsebleFund());
		fundRecordService.insertFundRecord(fundRecord);					
		return 1;
	}

}
