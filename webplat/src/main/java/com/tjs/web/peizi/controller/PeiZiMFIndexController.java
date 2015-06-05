package com.tjs.web.peizi.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.web.constants.PeiZiConstants;
import com.tjs.web.peizi.model.FreePeiziDetailVO;
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
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/freeActivity")
	public String  freeActivity(Model model) {
		//查询当天免费配活动是否有名额
		PZIndexCtrlModel pzIndexCtrlModel = new PZIndexCtrlModel();
		pzIndexCtrlModel.setDateString(sdf.format(Calendar.getInstance().getTime()));
		List<FreePeiziDetailVO> lstPZVO = iPeiZiIndexService.getFreePeiziDetailList(pzIndexCtrlModel);
		if(lstPZVO!=null 
				&& lstPZVO.size()>0 
				&& lstPZVO.get(0).getPeiziCount()>=PeiZiConstants.FREE_ALL_COUNT){
			model.addAttribute("result", PeiZiConstants.RESULT_NO_AMOUNT);
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
		pzIndexCtrlModel.setDateString(sdf.format(Calendar.getInstance().getTime()));
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
	public String  freeLastActivity() {
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
