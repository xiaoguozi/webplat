package com.tjs.web.peizi.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.peizi.constants.PeiziTypeEnum;
import com.tjs.admin.peizi.controller.PeiziRuleCtrlModel;
import com.tjs.admin.peizi.model.PeiziRule;
import com.tjs.admin.peizi.service.IPeizi;
import com.tjs.admin.peizi.service.IPeiziRule;

/**
 * 配资首页控制器
 * 
 *@author zhsoft
 *@since 2015年5月22日
 *
 **/
@Controller
@RequestMapping(value = "/web/peizitt")
public class PeiziTTController {
		
	@Resource
	IPeizi iPeizi;
	@Resource
	IPeiziRule iPeiziRule;
	/**
	 * 天天配
	 * @return
	 */
	@RequestMapping("/dayCapital")
	public String  dayCapital(Model model) {
		//获取天天配的配资规则
		PeiziRuleCtrlModel peiziRuleCtrlModel = new PeiziRuleCtrlModel();
		peiziRuleCtrlModel.getPeiziRule().setRuleType(PeiziTypeEnum.TTPEIZI.getKey());
		
		List<PeiziRule> lstPeiziRule = iPeiziRule.selectPeiziRule(peiziRuleCtrlModel);
		if(lstPeiziRule==null||lstPeiziRule.size()==0){
			throw new  RuntimeException("天天配资规则没有找到");
		}
		
		model.addAttribute("peiziRule",lstPeiziRule.get(0));
		
		return "web/peizi/ttp/ttpeizi";
	}

}
