package com.tjs.web.peizi.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.peizi.constants.PeiziTypeEnum;
import com.tjs.admin.peizi.controller.PeiziRuleCtrlModel;
import com.tjs.admin.peizi.model.PeiziRule;
import com.tjs.admin.peizi.service.IPeizi;
import com.tjs.admin.peizi.service.IPeiziRule;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.web.constants.PeiZiConstants;
import com.tjs.web.peizi.model.FreePeiziDetailVO;
import com.tjs.web.peizi.model.UserInfoExtendVO;
import com.tjs.web.peizi.service.IPeiZiIndexService;

/**
 * 免费配资控制器
 * 
 *@author dyj
 *@since 2015年5月22日
 *
 **/

@Controller
@RequestMapping(value = "/web/peizi/mfp")
public class PeiZiMFIndexController {
	
	@Resource
	private IPeiZiIndexService iPeiZiIndexService;
	
	@Resource
	private IPeizi iPeiziService;
	
	@Resource
	private UserService userService;
	
	@Resource
    private UserInfoService userInfoService;
	
	@Resource
	IPeiziRule iPeiziRule;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/freeActivity")
	public String  freeActivity(Model model) {
		//获取免费配的配资规则
		PeiziRuleCtrlModel peiziRuleCtrlModel = new PeiziRuleCtrlModel();
		peiziRuleCtrlModel.getPeiziRule().setRuleType(PeiziTypeEnum.MFPEIZI.getKey());
		
		List<PeiziRule> lstPeiziRule = iPeiziRule.selectPeiziRule(peiziRuleCtrlModel);
		if(lstPeiziRule==null||lstPeiziRule.size()==0){
			throw new  RuntimeException("免息配资规则没有找到");
		}
		PeiziRule peiziRule = lstPeiziRule.get(0);
		model.addAttribute("peiziRule",peiziRule);
		
		if(peiziRule.getRuleEnable().equals("20")){
			return "web/peizi/mfp/hdpeizi"; 
		}
		
		//查询当天免费配活动是否有名额
		PZIndexCtrlModel pzIndexCtrlModel = new PZIndexCtrlModel();
		pzIndexCtrlModel.setDateString(sdf.format(Calendar.getInstance().getTime()));
		pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MFPEIZI.getIntegerKey());
		List<FreePeiziDetailVO> lstPZVO = iPeiZiIndexService.getFreePeiziDetailList(pzIndexCtrlModel);
		if(lstPZVO!=null 
				&& lstPZVO.size()>0){
			if(lstPZVO.get(0).getPeiziCount()>=PeiZiConstants.FREE_ALL_COUNT){
				model.addAttribute("result", PeiZiConstants.RESULT_NO_AMOUNT);
			}else{
				Subject subject = SecurityUtils.getSubject();
				String username = (String)subject.getPrincipal();
				if(username!=null){
					User user = userService.selectByUsername(username);
					pzIndexCtrlModel.setUserId(user.getId());
					pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MFPEIZI.getIntegerKey());
					List<UserInfoExtendVO> lstUser = iPeiZiIndexService.getUserInfoExtendList(pzIndexCtrlModel);
					if(lstUser!=null 
							&& lstUser.size()>0){
						UserInfoExtendVO userInfoExtendVO = lstUser.get(0);
						if(userInfoExtendVO.getPeiziType()==PeiziTypeEnum.MFPEIZI.getIntegerKey()
								&& userInfoExtendVO.getIsOwnResource()==0){
							model.addAttribute("result", PeiZiConstants.RESULT_ALREADY_USED);
						}
					}
				}
			}
		}else{
			Subject subject = SecurityUtils.getSubject();
			String username = (String)subject.getPrincipal();
			if(username!=null){
				User user = userService.selectByUsername(username);
				pzIndexCtrlModel.setUserId(user.getId());
				pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MFPEIZI.getIntegerKey());
				List<UserInfoExtendVO> lstUser = iPeiZiIndexService.getUserInfoExtendList(pzIndexCtrlModel);
				if(lstUser!=null 
						&& lstUser.size()>0){
					UserInfoExtendVO userInfoExtendVO = lstUser.get(0);
					if(userInfoExtendVO.getPeiziType()==PeiziTypeEnum.MFPEIZI.getIntegerKey()
							&& userInfoExtendVO.getIsOwnResource()==0){
						model.addAttribute("result", PeiZiConstants.RESULT_ALREADY_USED);
					}
				}
			}
		}
		
		
		return "web/peizi/mfp/hdpeizi";
	}
	
	
	/**
	 * 免费配资下一步
	 * @return
	 */
	@RequestMapping("/freeNextActivity")
	public String  freeNextActivity(Model model) {
		PZIndexCtrlModel pzIndexCtrlModel = new PZIndexCtrlModel();
		pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MFPEIZI.getIntegerKey());
		pzIndexCtrlModel.setDateString(sdf.format(Calendar.getInstance().getTime()));
		
		//判断用户实名认证
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		if(username!=null){
			User user = userService.selectByUsername(username);
			UserInfo userInfoTemp = userInfoService.findUserInfoByUserId(user.getId());
			if(userInfoTemp.getIsValidate()!=1){
				//实名认证
				model.addAttribute("result", "-3");
				return "web/peizi/mfp/hdpeizi";
			}
		}
		
		int result = iPeiZiIndexService.checkFreePeiZiIsValid(pzIndexCtrlModel);
		if(PeiZiConstants.RESULT_ALREADY_USED==result){
			model.addAttribute("result", "您已经参加过该活动");
			return "web/peizi/mfp/hdpeizi";
		}else if(PeiZiConstants.RESULT_NO_AMOUNT==result){
			model.addAttribute("result", "名额已满");
			return "web/peizi/mfp/hdpeizi";
		}
		
		return "web/peizi/mfp/hdpeizinext";
	}
	
	/**
	 * 免费配资最后一步
	 * @return
	 */
	@RequestMapping("/freeLastActivity")
	public String  freeLastActivity(Model model) {
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		//如果用户没有登录直接访问
		if(username==null){
			return "web/peizi/mfp/hdpeizi";
		}
		Long dataId = 0L;
		//1、将用户能使用资源设置为0
		PZIndexCtrlModel pzIndexCtrlModel = new PZIndexCtrlModel();
		User user = userService.selectByUsername(username);
		pzIndexCtrlModel.setUserId(user.getId());
		pzIndexCtrlModel.setPeiziType(PeiziTypeEnum.MFPEIZI.getIntegerKey());
		List<UserInfoExtendVO> lstUser = iPeiZiIndexService.getUserInfoExtendList(pzIndexCtrlModel);
		if(lstUser!=null && lstUser.size()>0){
			UserInfoExtendVO userInfoExtendVO = lstUser.get(0);
			if(userInfoExtendVO.getIsOwnResource()!=PeiZiConstants.IS_OWN_RESOURCE){
				model.addAttribute("result", PeiZiConstants.RESULT_ALREADY_USED);
				return "web/peizi/mfp/hdpeizi";
			}else{
				//1、更新状态并产生订单
				userInfoExtendVO.setIsOwnResource(0);
				userInfoExtendVO.setPhone(username);
				dataId = iPeiZiIndexService.createFreeAllPeiziOrder(userInfoExtendVO, PeiziTypeEnum.MFPEIZI.getKey());
			}
		}
		model.addAttribute("dataId", dataId);
		return "web/peizi/mfp/hdpeizilast";
	}
	
	/**
	 * 免费配资查看方案进度
	 * @return
	 */
	@RequestMapping("/freeScheduleActivity")
	public String  freeScheduleActivity() {
		return "web/peizi/mfp/hdpeizipro";
	}
	
}
