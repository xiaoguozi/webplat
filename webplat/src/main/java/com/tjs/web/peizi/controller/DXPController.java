package com.tjs.web.peizi.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.peizi.constants.PeiziTypeEnum;
import com.tjs.admin.peizi.controller.PeiziRuleCtrlModel;
import com.tjs.admin.peizi.model.Peizi;
import com.tjs.admin.peizi.model.PeiziRule;
import com.tjs.admin.peizi.service.IPeizi;
import com.tjs.admin.peizi.service.IPeiziRule;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.BigDecimalUtils;
import com.tjs.admin.utils.StringUtils;
import com.tjs.web.peizi.token.TokenConstants;
import com.tjs.web.peizi.token.TokenHandler;

/**
 * 配资首页控制器
 * 
 *@author zhsoft
 *@since 2015年5月22日
 *
 **/
@Controller
@RequestMapping(value = "/web/peizi/dxp")
public class DXPController {
		
	@Resource
	IPeizi iPeizi;
	@Resource
	IPeiziRule iPeiziRule;
	
	 @Resource
	 private UserService userService;
	 
	 @Resource
	 private UserInfoService UserInfoService;
	/**
	 * 低息配第一步
	 * @return
	 */
	@RequestMapping("/lowCapital")
	public String  lowCapital(Model model) {
		
		
		//获取天天配的配资规则
		PeiziRuleCtrlModel peiziRuleCtrlModel = new PeiziRuleCtrlModel();
		peiziRuleCtrlModel.getPeiziRule().setRuleType(PeiziTypeEnum.DXPEIZI.getKey());
		
		List<PeiziRule> lstPeiziRule = iPeiziRule.selectPeiziRule(peiziRuleCtrlModel);
		if(lstPeiziRule==null||lstPeiziRule.size()==0){
			throw new  RuntimeException("低息配资规则没有找到");
		}
		PeiziRule peiziRule = lstPeiziRule.get(0);
		Peizi peizi = new Peizi();
		//规则信息
		peizi.setDataType(PeiziTypeEnum.DXPEIZI.getKey());
		peizi.setDataTypeSylx(peiziRule.getRuleGlsyType());
//		peizi.setDataZfglf(peiziRule.getRuleZhglf());
//		peizi.setDataNll(peiziRule.getRuleNll());
//		peizi.setDataYll(peiziRule.getRuleYll());
//		peizi.setDataRuleJjx(peiziRule.getRuleJjx());
//		peizi.setDataRulePcx(peiziRule.getRulePcx());
		peizi.setDataStep("1");
		

		peizi.setDataJyksDate("2");
		peizi.setDataZjsyqx(1);
		
		model.addAttribute("peiziRule",peiziRule);
		model.addAttribute("peizi",peizi);
		
		//判断用户实名认证
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		if(username!=null){
			User user = userService.selectByUsername(username);
			UserInfo userInfoTemp = UserInfoService.findUserInfoByUserId(user.getId());
			model.addAttribute("islogin", "true");
			if(userInfoTemp.getIsValidate()!=1){
				//实名认证
				model.addAttribute("result", "-3");//没有认证		
			}else{
				model.addAttribute("result", "-2");//已实名认证
			}
		}
		
		return "web/peizi/dxp/dxpeizi";
	}
	
	
	/**
	 * 低息配下一步
	 * @return
	 */
	@RequestMapping("/lowNextCapital")
	public String  lowNextCapital(Peizi peizi,Model model,HttpServletRequest request) {		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();	
		if(BigDecimalUtils.isNull(peizi.getDataZcpzj())||BigDecimalUtils.isNull(peizi.getDataTzbzj())
				||StringUtils.isBlank(username)){//判断是否等率
			return "redirect:/rest/web/peizi/dxp/lowCapital";  
		}
		String token = TokenHandler.generateGUID(request.getSession());
		peizi.setDataStep("2");
		peizi.setDataPzje(BigDecimalUtils.subtract(peizi.getDataZcpzj(), peizi.getDataTzbzj()));		
		peizi.setZfzje(BigDecimalUtils.add(peizi.getDataTzbzj(), peizi.getDataJklxTotal()));
		peizi.setZfglf(BigDecimalUtils.div(BigDecimalUtils.multiply(peizi.getDataZfglf(), peizi.getDataZcpzj()), new BigDecimal(10000)));
		model.addAttribute(TokenConstants.DEFAULT_TOKEN_NAME, token);
		return "web/peizi/dxp/dxpznext";		
	}
	
	
	
	
	
	/**
	 * 低息配最后一步
	 * @return
	 */
	@RequestMapping("/lowLastCapital")
	public String  lowLastCapital(Peizi peizi,Model model,HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();			
		if(BigDecimalUtils.isNull(peizi.getDataZcpzj())||BigDecimalUtils.isNull(peizi.getDataTzbzj())
				||StringUtils.isBlank(username)){
			return "redirect:/rest/web/peizi/dxp/lowCapital";  
		}
				
		if(!TokenHandler.validToken(request)){
			return "redirect:/rest/web/peizi/dxp/lowCapital"; 
		}
		
		
		peizi.setDataStep("3");
		peizi.setDataOperaStatus("10");//正在验资中
		if(peizi.getDataId()==null){
			Date nowDate = new Date();
			peizi.setDataCreateDate(nowDate);
			peizi.setDataModifyDate(nowDate);
			peizi.setDataSubmitDate(nowDate);			
			if(StringUtils.isNotBlank(username)){
				User user = userService.selectByUsername(username);
	    		UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
	    		peizi.setDataUserName(userInfo==null?"":userInfo.getName());
				peizi.setDataUserTel(username);
				peizi.setDataUserId(user.getId());	
			}   			
			iPeizi.insertPeizi(peizi);
		}else{
			Date nowDate = new Date();
			peizi.setDataModifyDate(nowDate);
			iPeizi.updatePeizi(peizi);
		}
		model.addAttribute("peizi",peizi);	
		return "web/peizi/dxp/dxpzlast";
	}
	
	

	/**
	 * 低息配查看方案进度
	 * @return
	 */
	@RequestMapping("/lowScheduleCapital")
	public String  lowScheduleCapital(@RequestParam(value="dataId",required=true) Long dataId,Model model) {
		//如果dataId不为空，从数据库里面读取记录
		if(null!=dataId&&!dataId.equals(new Long(0))){
			Peizi peizi = iPeizi.findByPeiziId(dataId);
			model.addAttribute("peizi",peizi);					
		}		
		return "web/peizi/dxp/dxpzyanzi";
	}
	
	
	
	
	
}
