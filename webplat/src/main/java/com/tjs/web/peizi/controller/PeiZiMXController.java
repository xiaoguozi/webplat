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
 * 免息赔控制器
 * 
 * @author dyj
 * @since 2015年6月6日
 *
 **/
@Controller
@RequestMapping(value = "/web/peizi/mxp")
public class PeiZiMXController {

	@Resource
	IPeizi iPeizi;
	@Resource
	IPeiziRule iPeiziRule;

	/**
	 * 天天配第一步
	 * 
	 * @return
	 */
	@RequestMapping("/monthCapital")
	public String dayCapital(Peizi peizio, Model model) {

		// 如果dataId不为空，从数据库里面读取记录
		if (null != peizio.getDataId()
				&& !peizio.getDataId().equals(new Long(0))) {
			Peizi peizi = iPeizi.findByPeiziId(peizio.getDataId());
			model.addAttribute("peizi", peizi);
			return "web/peizi/mxp/mxpeizi";
		}

		// 获取天天配的配资规则
		PeiziRuleCtrlModel peiziRuleCtrlModel = new PeiziRuleCtrlModel();
		peiziRuleCtrlModel.getPeiziRule().setRuleType(
				PeiziTypeEnum.YYPEIZI.getKey());

		List<PeiziRule> lstPeiziRule = iPeiziRule
				.selectPeiziRule(peiziRuleCtrlModel);
		if (lstPeiziRule == null || lstPeiziRule.size() == 0) {
			throw new RuntimeException("免息配资规则没有找到");
		}
		PeiziRule peiziRule = lstPeiziRule.get(0);
		Peizi peizi = new Peizi();
		// 规则信息
		peizi.setDataId(peizio.getDataId());
		peizi.setDataType(PeiziTypeEnum.YYPEIZI.getKey());
		peizi.setDataTypeSylx(peiziRule.getRuleGlsyType());
		peizi.setDataZfglf(peiziRule.getRuleZhglf());
		peizi.setDatanll(peiziRule.getRuleNll());
		peizi.setDataYll(peiziRule.getRuleYll());
		peizi.setDataRuleJjx(peiziRule.getRuleJjx());
		peizi.setDataRulePcx(peiziRule.getRulePcx());
		peizi.setDataStep("1");

		// 用户点击上一步选择信息
		peizi.setDataZcpzj(peizio.getDataZcpzj());
		peizi.setDataTzbzj(peizio.getDataTzbzj());
		peizi.setDataJjx(peizio.getDataJjx());
		peizi.setDataPcx(peizio.getDataPcx());
		peizi.setDataJklxTotal(peizio.getDataJklxTotal());
		peizi.setDataZjsyqx(peizio.getDataZjsyqx());
		peizi.setDataJyksDate(StringUtils.isBlank(peizio.getDataJyksDate()) ? "2"
				: peizio.getDataJyksDate());
		Integer dataZjsyqx = ((null == peizio.getDataZjsyqx() || new Integer(0)
				.equals(peizio.getDataZjsyqx())) ? 1 : peizio.getDataZjsyqx());
		peizi.setDataZjsyqx(dataZjsyqx);

		model.addAttribute("peizi", peizi);
		return "web/peizi/mxp/mxpeizi";
	}

	/**
	 * 天天配下一步
	 * 
	 * @return
	 */
	@RequestMapping("/monthNextCapital")
	public String monthNextCapital(Peizi peizi, Model model) {
		if (BigDecimalUtils.isNull(peizi.getDataZcpzj())
				|| BigDecimalUtils.isNull(peizi.getDataTzbzj())) {
			return "redirect:/rest/web/peizi/mxp/monthCapital";
		}

		peizi.setDataStep("2");
		peizi.setDataPzje(BigDecimalUtils.subtract(peizi.getDataZcpzj(),
				peizi.getDataTzbzj()));
		peizi.setZfzje(BigDecimalUtils.add(peizi.getDataTzbzj(),
				peizi.getDataJklxTotal()));
		peizi.setZfglf(BigDecimalUtils.div(
				BigDecimalUtils.multiply(peizi.getDataZfglf(),
						peizi.getDataZcpzj()), new BigDecimal(10000)));
		return "web/peizi/mxp/mxpznext";
	}

	/**
	 * 重新选择配资方案
	 * 
	 * @return
	 */
	@RequestMapping("/monthFirstCapital")
	public String monthFirstCapital(Peizi peizi, Model model) {
		peizi.setDataStep("1");
		peizi = new Peizi();
		model.addAttribute("peizi", peizi);
		return "web/peizi/mxp/mxpeizi";
	}

	/**
	 * 天天配最后一步
	 * 
	 * @return
	 */
	@RequestMapping("/monthLastCapital")
	public String monthLastCapital(Peizi peizi, Model model) {
		if (BigDecimalUtils.isNull(peizi.getDataZcpzj())
				|| BigDecimalUtils.isNull(peizi.getDataTzbzj())) {
			return "redirect:/rest/web/peizi/mxp/monthCapital";
		}
		peizi.setDataStep("3");
		peizi.setDataOperaStatus("10");// 正在验资中
		if (peizi.getDataId() == null) {
			iPeizi.insertPeizi(peizi);
		} else {
			iPeizi.updatePeizi(peizi);
		}
		model.addAttribute("peizi", peizi);
		return "web/peizi/mxp/mxpzlast";
	}

	/**
	 * 天天配查看方案进度
	 * 
	 * @return
	 */
	@RequestMapping("/monthScheduleCapital")
	public String monthScheduleCapital(
			@RequestParam(value = "dataId", required = true) Long dataId,
			Model model) {
		// 如果dataId不为空，从数据库里面读取记录
		if (null != dataId && !dataId.equals(new Long(0))) {
			Peizi peizi = iPeizi.findByPeiziId(dataId);
			model.addAttribute("peizi", peizi);
		}
		return "web/peizi/mxp/mxpzyanzi";
	}

}
