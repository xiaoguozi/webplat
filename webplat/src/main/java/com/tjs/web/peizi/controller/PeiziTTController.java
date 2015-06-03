package com.tjs.web.peizi.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.peizi.constants.PeiziTypeEnum;
import com.tjs.admin.peizi.controller.PeiziRuleCtrlModel;
import com.tjs.admin.peizi.model.Peizi;
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
	 * 天天配第一步
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
		PeiziRule peiziRule = lstPeiziRule.get(0);
		Peizi peizi = new Peizi();
		peizi.setDataType(PeiziTypeEnum.TTPEIZI.getKey());
		peizi.setDataTypeSylx(peiziRule.getRuleGlsyType());
		peizi.setDataZfglf(peiziRule.getRuleZhglf());
		peizi.setDatanll(peiziRule.getRuleNll());
		peizi.setDataYll(peiziRule.getRuleYll());
		peizi.setDataRuleJjx(peiziRule.getRuleJjx());
		peizi.setDataRulePcx(peiziRule.getRulePcx());	
		peizi.setDataJyksDate("2");
		peizi.setDataZjsyqx(1);
		peizi.setDataStep("1");
		model.addAttribute("peizi",peizi);		
		return "web/peizi/ttp/ttpeizi";
	}
	
	
	/**
	 * 天天配下一步
	 * @return
	 */
	@RequestMapping("/dayNextCapital")
	public String  dayNextCapital(Peizi peizi,Model model) {
		peizi.setDataStep("2");
		iPeizi.insertPeizi(peizi);
		return "web/peizi/ttpznext";
	}
	

}
