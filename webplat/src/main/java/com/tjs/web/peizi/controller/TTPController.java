package com.tjs.web.peizi.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tjs.admin.peizi.constants.PeiziTypeEnum;
import com.tjs.admin.peizi.controller.PeiziRuleCtrlModel;
import com.tjs.admin.peizi.model.Peizi;
import com.tjs.admin.peizi.model.PeiziRule;
import com.tjs.admin.peizi.service.IPeizi;
import com.tjs.admin.peizi.service.IPeiziRule;
import com.tjs.admin.utils.BigDecimalUtils;
import com.tjs.admin.utils.StringUtils;

/**
 * 配资首页控制器
 * 
 *@author zhsoft
 *@since 2015年5月22日
 *
 **/
@Controller
@RequestMapping(value = "/web/peizi/ttp")
public class TTPController {
		
	@Resource
	IPeizi iPeizi;
	@Resource
	IPeiziRule iPeiziRule;
	/**
	 * 天天配第一步  或者重新 选择重新选择配资方案
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
		//规则信息
		peizi.setDataType(PeiziTypeEnum.TTPEIZI.getKey());
		peizi.setDataTypeSylx(peiziRule.getRuleGlsyType());
		peizi.setDataZfglf(peiziRule.getRuleZhglf());
		peizi.setDatanll(peiziRule.getRuleNll());
		peizi.setDataYll(peiziRule.getRuleYll());
		peizi.setDataRuleJjx(peiziRule.getRuleJjx());
		peizi.setDataRulePcx(peiziRule.getRulePcx());
		peizi.setDataStep("1");
		

		peizi.setDataJyksDate("2");
		peizi.setDataZjsyqx(1);
		
		model.addAttribute("peizi",peizi);		
		return "web/peizi/ttp/ttpeizi";
	}
	
	
	/**
	 * 天天配下一步
	 * @return
	 */
	@RequestMapping("/dayNextCapital")
	public String  dayNextCapital(Peizi peizi,Model model) {		
		if(BigDecimalUtils.isNull(peizi.getDataZcpzj())||BigDecimalUtils.isNull(peizi.getDataTzbzj())){
			return "redirect:/rest/web/peizi/ttp/dayCapital";  
		}
		
		peizi.setDataStep("2");
		peizi.setDataPzje(BigDecimalUtils.subtract(peizi.getDataZcpzj(), peizi.getDataTzbzj()));		
		peizi.setZfzje(BigDecimalUtils.add(peizi.getDataTzbzj(), peizi.getDataJklxTotal()));
		peizi.setZfglf(BigDecimalUtils.div(BigDecimalUtils.multiply(peizi.getDataZfglf(), peizi.getDataZcpzj()), new BigDecimal(10000)));
		return "web/peizi/ttp/ttpznext";
	}
	

	
	
	/**
	 * 天天配最后一步
	 * @return
	 */
	@RequestMapping("/dayLastCapital")
	public String  dayLastCapital(Peizi peizi,Model model) {
		if(BigDecimalUtils.isNull(peizi.getDataZcpzj())||BigDecimalUtils.isNull(peizi.getDataTzbzj())){
			return "redirect:/rest/web/peizi/ttp/dayCapital";  
		}
		peizi.setDataStep("3");
		peizi.setDataOperaStatus("10");//正在验资中
		if(peizi.getDataId()==null){			
			iPeizi.insertPeizi(peizi);
		}else{
			iPeizi.updatePeizi(peizi);
		}
		model.addAttribute("peizi",peizi);	
		return "web/peizi/ttp/ttpzlast";
	}
	
	

	/**
	 * 天天配查看方案进度
	 * @return
	 */
	@RequestMapping("/dayScheduleCapital")
	public String  dayScheduleCapital(@RequestParam(value="dataId",required=true) Long dataId,Model model) {
		//如果dataId不为空，从数据库里面读取记录
		if(null!=dataId&&!dataId.equals(new Long(0))){
			Peizi peizi = iPeizi.findByPeiziId(dataId);
			model.addAttribute("peizi",peizi);					
		}		
		return "web/peizi/ttp/ttpzyanzi";
	}
	
	
}
