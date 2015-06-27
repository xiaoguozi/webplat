package com.tjs.web.zhifu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		String bankType = zhifuModel.getBankType();
		
		String p0_Cmd           = "Buy";
		String p2_Order         = "";
		String p3_Amt           = rechargeAmount;
//		String p4_Cur           = formatString(request.getParameter("p4_Cur"));
//		String p5_Pid           = formatString(request.getParameter("p5_Pid"));
//		String p6_Pcat          = formatString(request.getParameter("p6_Pcat"));
//		String p7_Pdesc         = formatString(request.getParameter("p7_Pdesc"));
//		String p8_Url           = formatString(request.getParameter("p8_Url"));
//		String p9_SAF           = formatString(request.getParameter("p9_SAF"));
//		String pa_MP            = formatString(request.getParameter("pa_MP"));
//		String pd_FrpId         = formatString(request.getParameter("pd_FrpId"));
//		String pm_Period        = formatString(request.getParameter("pm_Period"));
//		String pn_Unit          = formatString(request.getParameter("pn_Unit"));
//		String pr_NeedResponse  = formatString(request.getParameter("pr_NeedResponse"));
//
//		Map<String, String> params = new HashMap<String, String>();
//		params.put("p0_Cmd", 	p0_Cmd);
//		params.put("p2_Order",	p2_Order);
//		params.put("p3_Amt",	p3_Amt);
//		params.put("p4_Cur",	p4_Cur);
//		params.put("p5_Pid",	p5_Pid);
//		params.put("p6_Pcat",	p6_Pcat);
//		params.put("p7_Pdesc",	p7_Pdesc);
//		params.put("p8_Url",	p8_Url);
//		params.put("p9_SAF",	p9_SAF);
//		params.put("pa_MP",		pa_MP);
//		params.put("pd_FrpId",	pd_FrpId);
//		params.put("pm_Period",	pm_Period);
//		params.put("pn_Unit",	pn_Unit);
//		params.put("pr_NeedResponse",pr_NeedResponse);
//
//		out.println("params : " + params);
//
//		String payURL		= YeepayService.getPayURL(params);
		
		
		return "web/zhifu/enterCur"; 
	}
	
}
