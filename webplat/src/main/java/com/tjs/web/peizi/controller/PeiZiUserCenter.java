package com.tjs.web.peizi.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.peizi.constants.OperaStatusEnum;
import com.tjs.admin.peizi.constants.PeiziTypeEnum;
import com.tjs.admin.peizi.controller.PeiziCtrlModel;
import com.tjs.admin.peizi.controller.PeiziRuleCtrlModel;
import com.tjs.admin.peizi.model.Peizi;
import com.tjs.admin.peizi.model.PeiziRule;
import com.tjs.admin.peizi.service.IPeizi;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.BigDecimalUtils;
import com.tjs.admin.utils.StringUtils;

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
	public String  pzDetail(PZIndexCtrlModel pzIndexCtrlModel, Model model) {
		//已经配置需要先登录
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		PeiziCtrlModel peiziCtrlModel = new PeiziCtrlModel();
		peiziCtrlModel.getPeizi().setDataUserId(user.getId());
		peiziCtrlModel.getPeizi().setDataId(pzIndexCtrlModel.getDataId());
		
		List<Peizi> peizi = iPeiziService.selectPeizi(peiziCtrlModel);
		if(peizi!=null && peizi.size()>0){
			model.addAttribute("peizi", peizi.get(0));
		}
		
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
	
	
	
	/**
	 * 月月配中心
	 * @return
	 */
	@RequestMapping("/yypUserCenter")
	public String  yypUserCenter(PeiziCtrlModel peiziCtrlModel,Model model) {
		//已经配置需要先登录
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		
		peiziCtrlModel.getPeizi().setDataUserId(user.getId());
		peiziCtrlModel.getPeizi().setDataType(PeiziTypeEnum.YYPEIZI.getKey());
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
		
		return "web/peizi/yyp/yypzusercenter";
	}
	
	
	
	/**
	 * 低息配中心
	 * @return
	 */
	@RequestMapping("/dxpUserCenter")
	public String  dxpUserCenter(PeiziCtrlModel peiziCtrlModel,Model model) {
		//已经配置需要先登录
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		
		peiziCtrlModel.getPeizi().setDataUserId(user.getId());
		peiziCtrlModel.getPeizi().setDataType(PeiziTypeEnum.DXPEIZI.getKey());
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
		
		return "web/peizi/dxp/dxpzusercenter";
	}
	
	

	/**
	 * 配资协议 
	 * @return
	 */
	@RequestMapping("/pzzhongxin")
	public String pzZhongXin(PeiziCtrlModel peiziCtrlModel,Model model) {
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
	
		peiziCtrlModel.getPeizi().setDataUserId(user.getId());
		peiziCtrlModel.setNotEqualoperaStatus(OperaStatusEnum.YWJIE.getKey());
		peiziCtrlModel.setPageSize(1);
		peiziCtrlModel.setSortField("data_submit_date");
		peiziCtrlModel.setSortType("desc");
		
		//天天配
		peiziCtrlModel.getPeizi().setDataType(PeiziTypeEnum.TTPEIZI.getKey());		
		List<Peizi> lstTTPeizi = iPeiziService.selectPeizi(peiziCtrlModel);
		
		//月月配
		peiziCtrlModel.getPeizi().setDataType(PeiziTypeEnum.YYPEIZI.getKey());
		List<Peizi> lstYYPeizi = iPeiziService.selectPeizi(peiziCtrlModel);
		
		//低息1配1 
		peiziCtrlModel.getPeizi().setDataType(PeiziTypeEnum.DXPEIZI.getKey());
		List<Peizi> lstDXPeizi = iPeiziService.selectPeizi(peiziCtrlModel);
		
		if(null!=lstTTPeizi&&lstTTPeizi.size()>0){
			model.addAttribute("ttPeizi", lstTTPeizi.get(0));	
		}
		
		if(null!=lstYYPeizi&&lstYYPeizi.size()>0){
			model.addAttribute("yyPeizi", lstYYPeizi.get(0));	
		}
		
		if(null!=lstDXPeizi&&lstDXPeizi.size()>0){
			model.addAttribute("dxPeizi", lstDXPeizi.get(0));	
		}
			
		return "web/peizi/pzzhongxin";            
	}	
	
	
}
