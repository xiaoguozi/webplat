package com.tjs.web.zhifu.controller;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import com.tjs.core.zhifu.Configuration;
import com.tjs.core.zhifu.DigestUtil;
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
	
	private static final String FAIL = "fail";
	
	@RequestMapping("/p2pCallback")
	@ResponseBody
    public String p2pCallback(ZhifuModel zhifuModel) {
		
		//检查返回的参数和hmac是否被认为修改
		if(!checkHmac(zhifuModel)){
			return FAIL;
		}
		
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
	
	/**
	 * 比对hmac是否一致
	 * @param zhifuModel
	 * @return boolean
	 */
	private boolean checkHmac(ZhifuModel zhifuModel){
		 /** --回调结果参数-- */
		 String p1_MerId = formatString(zhifuModel.getP1_MerId());
		 String r0_Cmd = formatString(zhifuModel.getR0_Cmd());
		 String r1_Code = formatString(zhifuModel.getR1_Code());
		 String r2_TrxId = formatString(zhifuModel.getR2_TrxId());
		 String r3_Amt = formatString(zhifuModel.getR3_Amt());
		 String r4_Cur = formatString(zhifuModel.getR4_Cur());
		 String r5_Pid = formatString(zhifuModel.getR5_Pid());
		 String r6_Order = formatString(zhifuModel.getR6_Order());
		 String r7_Uid = formatString(zhifuModel.getR7_Uid());
		 String r8_MP = formatString(zhifuModel.getR8_MP());
		 String r9_BType = formatString(zhifuModel.getR9_BType());
		 
		 String keyValue = Configuration.getInstance().getValue("keyValue");
		 
		 String[] strArr = new String[]{p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur,
				 r5_Pid, r6_Order,  r7_Uid, r8_MP, r9_BType};
		 String hmac = DigestUtil.getHmac(strArr, keyValue);
		 if(hmac.equals(zhifuModel.getHmac())){
			 return true;
		 }
		 
		 return false;
	}
	
	private String formatString(String text) {
		return text == null ? "" : text.trim();
	}
	
}
