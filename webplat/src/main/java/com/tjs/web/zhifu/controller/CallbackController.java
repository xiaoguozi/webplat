package com.tjs.web.zhifu.controller;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.zhifu.controller.CustomerFundCtrlModel;
import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.admin.zhifu.model.FundRecord;
import com.tjs.admin.zhifu.model.Recharge;
import com.tjs.admin.zhifu.service.IAreaBank;
import com.tjs.admin.zhifu.service.ICustbank;
import com.tjs.admin.zhifu.service.ICustomerFund;
import com.tjs.admin.zhifu.service.IFundRecord;
import com.tjs.admin.zhifu.service.IRecharge;
import com.tjs.admin.zhifu.service.IWithdraw;
import com.tjs.admin.zhifu.zfenum.FundRecordFundTypeEnum;
import com.tjs.admin.zhifu.zfenum.RechargeStatusEnum;
import com.tjs.web.zhifu.service.IZhifuService;

@Controller
@RequestMapping(value = "/web/zhifu")
public class CallbackController {

	@Resource
	private IRecharge rechargeService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private UserInfoService userInfoService;
	
	@Resource
    private IZhifuService zhifuService;
	
	@Resource
	private ICustomerFund customerFundService;
	
	@Resource
	private IFundRecord fundRecordService;
	
	
	@Resource
	private ICustbank custbankService;
	
	@Resource
	private IAreaBank areaService;
	
	@Resource
	private IWithdraw withdrawService;
	
	@Autowired  
	private  HttpServletRequest request; 
	
	/** 充值流水前缀 */
	private static final String PREFIX = "TJS_";
	
	/** 点对点返回给易宝服务器  */
	private static final String SUCCESS = "success";
	
	private Logger logging = Logger.getLogger(CallbackController.class);
	
	@RequestMapping("/p2pCallback")
	@ResponseBody
    public String p2pCallback(ZhifuModel zhifuModel) {
		
		//1、充值流水
		String orderId = zhifuModel.getR6_Order();
		orderId = orderId.replace(PREFIX, "");
		Recharge recharge = rechargeService.findByRechargeId(Long.valueOf(orderId));
		//用户Id
		Long userId =recharge.getCustomerId();
		UserInfo userInfo = userInfoService.findUserInfoByUserId(userId);
		if(RechargeStatusEnum.SUCCESS.getIntegerKey().equals(recharge.getStatus())){
			return SUCCESS; 
		}
		
		recharge.setStatus(RechargeStatusEnum.SUCCESS.getIntegerKey());
		recharge.setPaynumber(zhifuModel.getR2_TrxId());
		recharge.setUpdateTime(Calendar.getInstance().getTime());
		
		//2、个人账户信息
		CustomerFund customerFund = getCustomerFund(userId);
		BigDecimal usableAmount = null;
		if(customerFund.getUsebleFund()==null){
			usableAmount = new BigDecimal(zhifuModel.getR3_Amt());
		}else{
			usableAmount = customerFund.getUsebleFund().add(new BigDecimal(zhifuModel.getR3_Amt()));
		}
		customerFund.setUsebleFund(usableAmount);
		//设置总金额
		customerFund.setTotalFund(customerFund.getTotalFund()==null?new BigDecimal(zhifuModel.getR3_Amt()):
			customerFund.getTotalFund().add(new BigDecimal(zhifuModel.getR3_Amt())));
		
		//3、资金流水
		FundRecord fundRecord = new FundRecord();
		fundRecord.setAmount(new BigDecimal(zhifuModel.getR3_Amt()));
		fundRecord.setBusinessId(Long.valueOf(orderId));
		fundRecord.setCreateBy(userInfo.getName()==null?userInfo.getMobileNo():userInfo.getName());
		fundRecord.setCreateTime(Calendar.getInstance().getTime());
		fundRecord.setCustomerId(userId);
		fundRecord.setFundType(FundRecordFundTypeEnum.CZ.getKey());
		fundRecord.setRecordDesc(FundRecordFundTypeEnum.CZ.getValue());
		fundRecord.setUsableAmount(usableAmount);
		
		zhifuService.callbackUpdate(recharge, fundRecord, customerFund);
		
		return SUCCESS; 
	}
	
	/**
	 * 获取个人账户信息
	 * @param userId
	 * @return CustomerFund
	 */
	private CustomerFund getCustomerFund(Long userId){
		CustomerFund customerFund = null;
		//查询用户个人账户
		CustomerFundCtrlModel customerFundCtrlModel = new CustomerFundCtrlModel();
		customerFundCtrlModel.getCustomerFund().setCustomerId(userId);
		List<CustomerFund> lstCustomerFund = customerFundService.selectCustomerFund(customerFundCtrlModel);
		if(lstCustomerFund!=null && lstCustomerFund.size()>0){
			customerFund = lstCustomerFund.get(0);
		}else{
			CustomerFund cNewCustomerFund = new CustomerFund();
			cNewCustomerFund.setCustomerId(userId);
			cNewCustomerFund.setTotalFund(BigDecimal.ZERO);
			cNewCustomerFund.setUsebleFund(BigDecimal.ZERO);
			cNewCustomerFund.setPeiziFund(BigDecimal.ZERO);
			cNewCustomerFund.setFxbzFund(BigDecimal.ZERO);
			cNewCustomerFund.setDongjieFund(BigDecimal.ZERO);
			
			cNewCustomerFund.setLockId(1);
			customerFundService.insertCustomerFund(cNewCustomerFund);
			customerFund = cNewCustomerFund;
		}
		
		return customerFund;
	}
	
}
