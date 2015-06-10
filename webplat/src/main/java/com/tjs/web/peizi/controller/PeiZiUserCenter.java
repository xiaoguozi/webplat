package com.tjs.web.peizi.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.model.User;
import com.tjs.admin.peizi.constants.PeiziTypeEnum;
import com.tjs.admin.peizi.controller.PeiziCtrlModel;
import com.tjs.admin.peizi.model.Peizi;
import com.tjs.admin.peizi.service.IPeizi;
import com.tjs.admin.service.UserService;

/**
 * 用户中心配资
 * 
 *@author dyj
 *@since 2015年6月9日
 *
 **/

@Controller
@RequestMapping(value = "/web/peizi/usercenter")
public class PeiZiUserCenter {
	
	@Resource
	private IPeizi iPeiziService;
	
	@Resource
	private UserService userService;

	/**
	 * 免费配资用户中心
	 * @return
	 */
	@RequestMapping("/mfp")
	public String  mfpUserCenter(Model model) {
		//已经配置需要先登录
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		
		PeiziCtrlModel peiziCtrlModel = new PeiziCtrlModel();
		peiziCtrlModel.getPeizi().setDataUserId(user.getId());
		peiziCtrlModel.getPeizi().setDataType(PeiziTypeEnum.MFPEIZI.getKey());
		//查询配资记录
		List<Peizi> lstPeizi = iPeiziService.selectPeizi(peiziCtrlModel);
		if(lstPeizi!=null && lstPeizi.size()>0){
			model.addAttribute("peizi", lstPeizi.get(0));
		}
		
		return "web/peizi/mfp/hdpeiziuser";
	}
	
	/**
	 * 免费配资用户中心
	 * @return
	 */
	@RequestMapping("/mxp")
	public String  mxpUserCenter(Model model) {
		//已经配置需要先登录
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		
		PeiziCtrlModel peiziCtrlModel = new PeiziCtrlModel();
		peiziCtrlModel.getPeizi().setDataUserId(user.getId());
		peiziCtrlModel.getPeizi().setDataType(PeiziTypeEnum.MXPEIZI.getKey());
		//查询配资记录
		List<Peizi> lstPeizi = iPeiziService.selectPeizi(peiziCtrlModel);
		if(lstPeizi!=null && lstPeizi.size()>0){
			model.addAttribute("peizi", lstPeizi.get(0));
		}
		
		return "web/peizi/mxp/mxpzuser";
	}
	
	/**
	 * 配资明细
	 * @return
	 */
	@RequestMapping("/pzdetail")
	public String  pzDetail(Model model) {
		//已经配置需要先登录
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		
		
		return "web/peizi/peiziDetail";
	}
	
	
	
	/**
	 * 天天配中心
	 * @return
	 */
	@RequestMapping("/ttpUserCenter")
	public String  ttpUserCenter(PeiziCtrlModel peiziCtrlModel,Model model) {
		//已经配置需要先登录
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		
		peiziCtrlModel.getPeizi().setDataUserId(user.getId());
		peiziCtrlModel.getPeizi().setDataType(PeiziTypeEnum.TTPEIZI.getKey());
		peiziCtrlModel.setPageSize(3);
		peiziCtrlModel.setSortField("data_submit_date");
		peiziCtrlModel.setSortType("desc");;
		
		int icount = iPeiziService.countPeizi(peiziCtrlModel);
		peiziCtrlModel.setTotalCount(icount);
		
		//判断请求页
        int totalPageNO = peiziCtrlModel.getTotalPageSize();//总页数
        int currentPageNo = 1;//当前页
        if(peiziCtrlModel.getPageNo()<1||totalPageNO==0){//如果请求的页数小于1，设置成第一页
        	currentPageNo =1;
        } else if(peiziCtrlModel.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	currentPageNo =totalPageNO;
        }else{
        	currentPageNo = peiziCtrlModel.getPageNo();
        }
        peiziCtrlModel.setPageNo(currentPageNo);
		
		
		//查询配资记录
		List<Peizi> lstPeizi = null;
		if(icount>0){
			lstPeizi= iPeiziService.selectPeizi(peiziCtrlModel);
		}
		model.addAttribute("lstPeizi", lstPeizi);
		model.addAttribute("peiziCtrlModel", peiziCtrlModel);
		
		return "web/peizi/ttp/ttpzusercenter";
	}
	
}