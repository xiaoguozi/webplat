package com.tjs.web.zhifu.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.core.zhifu.YeepayService;

@Controller
@RequestMapping(value = "/web/userCenter/zhifu")
public class ZhifuController {

	@RequestMapping("/enterCur")
    public String enterCur(Model model) {
		model.addAttribute("isLog", "true");
		return "web/zhifu/enterCur"; 
	}
	
	@RequestMapping("/epay")
    public String epay(ZhifuModel zhifuModel, Model model) {
		String rechargeAmount = zhifuModel.getRechargeAmount();
		String pdFrpId = zhifuModel.getPdFrpId();
		String callbackUrl = zhifuModel.getCallbackUrl();
		
		String p0_Cmd           = "Buy";
		String p2_Order         = "";
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
		
		return "web/zhifu/callback";
	}
	
}
