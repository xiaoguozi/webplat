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

	@RequestMapping("/enterCur")
    public String enterCur(Model model) {
		model.addAttribute("isLog", "true");
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
		insertRecharge(request, recharge);
		
		String p0_Cmd           = "Buy";
		String p2_Order         = String.valueOf(recharge.getRechangeId());
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
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		UserInfo userInfo = userInfoService.findUserInfoByUserId(user.getId());
		
		//1、充值流水
		String orderId = zhifuModel.getR6_Order();
		Recharge recharge = rechargeService.findByRechargeId(Long.valueOf(orderId));
		recharge.setStatus(RechargeStatusEnum.SUCCESS.getIntegerKey());
		
		//查询用户个人账户
		CustomerFundCtrlModel customerFundCtrlModel = new CustomerFundCtrlModel();
		
		List<CustomerFund> lstCustomerFund = customerFundService.selectCustomerFund(customerFundCtrlModel);
		CustomerFund customerFund = null;
		if(lstCustomerFund!=null && lstCustomerFund.size()>0){
			customerFund = lstCustomerFund.get(0);
		}else{
			CustomerFund cNewCustomerFund = new CustomerFund();
			cNewCustomerFund.setCustomerId(user.getId());
			cNewCustomerFund.setUsebleFund(BigDecimal.ZERO);
			customerFundService.insertCustomerFund(cNewCustomerFund);
			customerFund = cNewCustomerFund;
		}
		
		//2、账户
		BigDecimal usableAmount = null;
		if(customerFund.getUsebleFund()==null){
			usableAmount = new BigDecimal(zhifuModel.getR3_Amt());
		}else{
			usableAmount = customerFund.getUsebleFund().add(new BigDecimal(zhifuModel.getR3_Amt()));
		}
		customerFund.setUsebleFund(usableAmount);
		
		//3、资金流水
		FundRecord fundRecord = new FundRecord();
		fundRecord.setAmount(new BigDecimal(zhifuModel.getR3_Amt()));
		fundRecord.setBusinessId(Long.valueOf(orderId));
		fundRecord.setCreateBy(userInfo.getName()==null?username:userInfo.getName());
		fundRecord.setCreateTime(Calendar.getInstance().getTime());
		fundRecord.setCustomerId(user.getId());
		fundRecord.setRecordDesc("充值");
		fundRecord.setUsableAmount(usableAmount);
		
		zhifuService.callbackUpdate(recharge, fundRecord, customerFund);
		
		return "web/zhifu/callback";
	}
	
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
