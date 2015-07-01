package com.tjs.web.zhifu.controller;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.zhifu.controller.CustomerFundCtrlModel;
import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.admin.zhifu.model.FundRecord;
import com.tjs.admin.zhifu.model.Recharge;
import com.tjs.admin.zhifu.service.ICustomerFund;
import com.tjs.admin.zhifu.service.IRecharge;
import com.tjs.admin.zhifu.zfenum.FundRecordFundTypeEnum;
import com.tjs.admin.zhifu.zfenum.RechargeFundTypeEnum;
import com.tjs.admin.zhifu.zfenum.RechargeStatusEnum;
import com.tjs.core.zhifu.YeepayService;
import com.tjs.web.zhifu.service.IZhifuService;

@Controller
@RequestMapping(value = "/web/userCenter/zhifu")
public class ZhifuController {
	
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
	
	@Autowired  
	private  HttpServletRequest request; 

	/** 充值流水前缀 */
	private static final String PREFIX = "TJS_TEST_";
	
	/** 点对点返回给易宝服务器  */
	private static final String SUCCESS = "success";
	
	@RequestMapping("/enterCur")
    public String enterCur(Model model) {
		model.addAttribute("isLog", "true");
		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		//查询用户个人账户
		CustomerFundCtrlModel customerFundCtrlModel = new CustomerFundCtrlModel();
		customerFundCtrlModel.getCustomerFund().setCustomerId(user.getId());
		
		List<CustomerFund> lstCustomerFund = customerFundService.selectCustomerFund(customerFundCtrlModel);
		CustomerFund customerFund = null;
		if(lstCustomerFund!=null && lstCustomerFund.size()>0){
			customerFund = lstCustomerFund.get(0);
		}else{
			CustomerFund cNewCustomerFund = new CustomerFund();
			cNewCustomerFund.setCustomerId(user.getId());
			cNewCustomerFund.setUsebleFund(BigDecimal.ZERO);
			cNewCustomerFund.setTotalFund(BigDecimal.ZERO);
			cNewCustomerFund.setLockId(1);
			customerFundService.insertCustomerFund(cNewCustomerFund);
			customerFund = cNewCustomerFund;
		}
		
		model.addAttribute("totalFund", customerFund.getTotalFund());
		model.addAttribute("usableFund", customerFund.getUsebleFund());
		
		return "web/zhifu/enterCur"; 
	}
	
	@RequestMapping("/epay")
    public String epay(HttpServletRequest request, ZhifuModel zhifuModel, Model model) {
		String rechargeAmount = zhifuModel.getRechargeAmount();
		String pdFrpId = zhifuModel.getPdFrpId();
		String callbackUrl = zhifuModel.getCallbackUrl();
		
		//插入充值记录
		Recharge recharge = new Recharge();
		recharge.setAmount(new BigDecimal(rechargeAmount));
		recharge.setLockId(1);
		insertRecharge(request, recharge);
		
		String p0_Cmd           = "Buy";
		String p2_Order         = PREFIX + String.valueOf(recharge.getRechangeId());
		String p3_Amt           = rechargeAmount;
		String p4_Cur           = "CNY";
		String p5_Pid           = "productname";
		String p6_Pcat          = "productcat";
		String p7_Pdesc         = "productdesc";
		String p8_Url           = callbackUrl;
		String p9_SAF           = "0";
		String pa_MP            = "";
		String pd_FrpId         = pdFrpId;
		String pm_Period        = "";
		String pn_Unit          = "";
		String pr_NeedResponse  = "1";

		Map<String, String> params = new HashMap<String, String>();
		params.put("p0_Cmd", 	p0_Cmd);
		params.put("p2_Order",	p2_Order);
		params.put("p3_Amt",	p3_Amt);
		params.put("p4_Cur",	p4_Cur);
		params.put("p5_Pid",	p5_Pid);
		params.put("p6_Pcat",	p6_Pcat);
		params.put("p7_Pdesc",	p7_Pdesc);
		params.put("p8_Url",	p8_Url);
		params.put("p9_SAF",	p9_SAF);
		params.put("pa_MP",		pa_MP);
		params.put("pd_FrpId",	pd_FrpId);
		params.put("pm_Period",	pm_Period);
		params.put("pn_Unit",	pn_Unit);
		params.put("pr_NeedResponse",pr_NeedResponse);

		String payURL		= YeepayService.getPayURL(params);
		
		return "redirect:"+payURL;  
	}
	
	@RequestMapping("/callback")
    public String callback(ZhifuModel zhifuModel, Model model) {
		
		//1、充值流水
		String orderId = zhifuModel.getR6_Order();
		orderId = orderId.replace(PREFIX, "");
		Recharge recharge = rechargeService.findByRechargeId(Long.valueOf(orderId));
		//用户Id
		Long userId =recharge.getCustomerId();
		UserInfo userInfo = userInfoService.findUserInfoByUserId(userId);
		
		if(RechargeStatusEnum.SUCCESS.getIntegerKey().equals(recharge.getStatus())){
			CustomerFund customerFund = getCustomerFund(userId);
			model.addAttribute("amount", zhifuModel.getR3_Amt());
			model.addAttribute("totalAmount", customerFund.getTotalFund());
			return "web/zhifu/callback"; 
		}
		recharge.setStatus(RechargeStatusEnum.SUCCESS.getIntegerKey());
		recharge.setPaynumber(zhifuModel.getR2_TrxId());
		
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
		
		model.addAttribute("amount", zhifuModel.getR3_Amt());
		model.addAttribute("totalAmount", customerFund.getTotalFund());
		
		return "web/zhifu/callback";
	}
	
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
			cNewCustomerFund.setUsebleFund(BigDecimal.ZERO);
			cNewCustomerFund.setTotalFund(BigDecimal.ZERO);
			cNewCustomerFund.setLockId(1);
			customerFundService.insertCustomerFund(cNewCustomerFund);
			customerFund = cNewCustomerFund;
		}
		
		return customerFund;
	}
	
	/**
	 * 插入充值流水
	 * @param request
	 * @param recharge
	 */
	private void insertRecharge(HttpServletRequest request, Recharge recharge){
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		
		recharge.setFundType(RechargeFundTypeEnum.YIBAOZHIFU.getKey());
		recharge.setCustomerId(user.getId());
		recharge.setStatus(0);
		recharge.setCreateTime(Calendar.getInstance().getTime());
		recharge.setCreateBy(userInfo.getName()==null?username:userInfo.getName());
		recharge.setRequestIp(request.getRemoteAddr());
		
		rechargeService.insertRecharge(recharge);
	}
	
}
