package com.tjs.wx.xintuo.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.order.model.Order;
import com.tjs.admin.order.service.IOrderService;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.StringUtils;
import com.tjs.admin.xintuo.controller.XinTuoSeachCtrlVO;
import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.admin.xintuo.service.IProductXtcpService;
import com.tjs.admin.xintuo.util.BigDecimalUtils;


/**
 * 控制器
 * 
 * @author hzg
 * @since 2015年7月15日 下午3:54:00
 **/
@Controller
@RequestMapping(value ="/wx/xintuo")
public class XintuoController {
	

    
    @Resource
	private IOrderService iOrderService;
    
	@Resource
	private IProductXtcpService iProductXtService;
		
	 @Resource
	 private UserService userService;
	 
	 @Resource
	 private UserInfoService UserInfoService;
	
    
	@RequestMapping("/index")
    public String index(Model model) {
		
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		
		if(StringUtils.isNotBlank(username)){
			User user = userService.selectByUsername(username);
			UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());			
			model.addAttribute("username", (StringUtils.isBlank(userInfo.getName())?username:userInfo.getName()));		
		}else{
			model.addAttribute("username", "你好");
		}
				
		List<ProductXtcp> lstXtcp =  iProductXtService.selectProductXtcpIndex();
		if(lstXtcp!=null&&lstXtcp.size()>0){
			model.addAttribute("xtcp", lstXtcp.get(0));
		}else{
			model.addAttribute("xtcp", new ProductXtcp());	
		}
        return "wx/xintuo/index";
    }
	
	
	@RequestMapping("/xintuoInfo")
    public String xintuoInfo() {				
        return "wx/xintuo/xintuoInfo";
    }
	
	@RequestMapping("/list")
    public String list(Model model,XinTuoSeachCtrlVO xinTuoSeachCtrlVO) {			
		//设置总条数
		xinTuoSeachCtrlVO.setPageSize(5);
		xinTuoSeachCtrlVO.setSortField("xtcp_tjno");
		xinTuoSeachCtrlVO.setSortType("ASC");
    	int totalcount = iProductXtService.countProductXtcpTrust(xinTuoSeachCtrlVO);
    	xinTuoSeachCtrlVO.setTotalCount(totalcount); 
    	
    	//判断请求页
        int totalPageNO = xinTuoSeachCtrlVO.getTotalPageSize();//总页数
        int currentPageNo = 1;//当前页
        if(xinTuoSeachCtrlVO.getPageNo()<1||totalPageNO==0){//如果请求的页数小于1，设置成第一页
        	currentPageNo =1;
        } else if(xinTuoSeachCtrlVO.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	currentPageNo =totalPageNO;
        }else{
        	currentPageNo = xinTuoSeachCtrlVO.getPageNo();
        }
        
    	xinTuoSeachCtrlVO.setPageNo(currentPageNo);
    	
    	List<ProductXtcp> lstProductVos= iProductXtService.selectProductXtcpTrust(xinTuoSeachCtrlVO);    	
    	//分页结束
    	model.addAttribute("lstProductVos", lstProductVos);
    	model.addAttribute("xinTuoSeachCtrlVO", xinTuoSeachCtrlVO);
        return "wx/xintuo/xintuolist";
    }
	
	
	@RequestMapping("/listMore")
	@ResponseBody
    public Map<String, Object> listMore(XinTuoSeachCtrlVO xinTuoSeachCtrlVO) {
		Map<String, Object> result = new HashMap<String, Object>();		
		xinTuoSeachCtrlVO.setPageSize(5);
		xinTuoSeachCtrlVO.setSortField("xtcp_tjno");
		xinTuoSeachCtrlVO.setSortType("ASC");
    	int totalcount = iProductXtService.countProductXtcpTrust(xinTuoSeachCtrlVO);
    	xinTuoSeachCtrlVO.setTotalCount(totalcount); 
    	
    	//判断请求页
        int totalPageNO = xinTuoSeachCtrlVO.getTotalPageSize();//总页数
        int currentPageNo = 1;//当前页
        if(xinTuoSeachCtrlVO.getPageNo()<1||totalPageNO==0){//如果请求的页数小于1，设置成第一页
        	currentPageNo =1;
        } else if(xinTuoSeachCtrlVO.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	currentPageNo =totalPageNO;
        }else{
        	currentPageNo = xinTuoSeachCtrlVO.getPageNo();
        }
        
    	xinTuoSeachCtrlVO.setPageNo(currentPageNo);
    	
    	List<ProductXtcp> lstProductVos= iProductXtService.selectProductXtcpTrust(xinTuoSeachCtrlVO); 
    	if(lstProductVos==null){
    		lstProductVos = new ArrayList<ProductXtcp>();
    	}
    	result.put("xinTuoSeachCtrlVO", xinTuoSeachCtrlVO);
    	result.put("bizData", lstProductVos);
        return result;
    }
	
	
	@RequestMapping("/detail")
    public String detail(Model model,@RequestParam(value="id",required=false) Long xtcpId) {
		
		ProductXtcp productXtcp = iProductXtService.findByProductXtcpId(xtcpId);
    	BigDecimal div10000 = new BigDecimal(10000);		
    	productXtcp.setXtcpFxgm(BigDecimalUtils.div(productXtcp.getXtcpFxgm(), div10000));
    	productXtcp.setXtcpZdrgje(BigDecimalUtils.div(productXtcp.getXtcpZdrgje(), div10000));
   	
    	model.addAttribute("xtcp", productXtcp);
        return "wx/xintuo/xintuoDetail";
    }
	
	
	@RequestMapping("/reservePage")
    public String reservePage(XintuoCtrlModel xintuoCtrlModel, Model model) {
		Long productId = xintuoCtrlModel.getProductId();
		ProductXtcp productXtcp = iProductXtService.findByProductXtcpId(productId);
		
		model.addAttribute("xtName", productXtcp.getXtcpSplname());
		model.addAttribute("productId", productId);
        return "wx/xintuo/reserve";
    }
	
	/**
     * 
     * @return
     */
     @RequestMapping("/orderProduct")
     public String orderProduct(@RequestParam(value="productId",required=false) Long productId,
    		 @RequestParam(value="userName") String userName,
    		 @RequestParam(value="userPhone") String  userPhone,
    		 @RequestParam(value="dataRemark") String dataRemark) {
     	Order order = new Order();
     	
     	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		if(StringUtils.isNotBlank(username)){
			User user = userService.selectByUsername(username);
			order.setUserID(user.getId());
		}
		
     	
     	order.setCreateDate(new Date());
     	//未处理
     	order.setOperateStatus("10");
     	order.setProductType("10");
     	order.setProductId(productId);
     	order.setRemark(dataRemark);
     	if(productId!=null){
     		ProductXtcp productXtcp = iProductXtService.findByProductXtcpId(productId);
     		order.setProductName(productXtcp.getXtcpSplname());
     	}   	
     	order.setTelphone(userPhone);;
     	order.setUserName(userName);    	
     	
     	iOrderService.insertOrder(order);
     	
     	return "wx/xintuo/success";
     }
	
}
