package com.tjs.web.xintuo.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.order.model.Order;
import com.tjs.admin.order.service.IOrderService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.xintuo.controller.XinTuoCpCtrlModel;
import com.tjs.admin.xintuo.controller.XinTuoGsCtrlModel;
import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.admin.xintuo.service.IProductXtcpService;
import com.tjs.admin.xintuo.service.IProductXtgsService;
import com.tjs.admin.xintuo.util.BigDecimalUtils;
/**
 * 系统产品//http://127.0.0.1:8080/webplat/product/xt/list?method=getXtList
 * 
 * @author 何志刚
 * @since 2015年3月21日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/web/xintuo/trust")
public class TrustController {
	@Resource
	private IProductXtcpService iProductXtService;
	
	@Resource
	private IProductXtgsService iProductgsService;
	
	@Resource
	private IOrderService iOrderService;
	
	@Resource
	private UserService iUserService;
	
	
	/**
	 * 查询信托首页
	 * @param model
	 * @return
	 */
    @RequestMapping("/trustIndex")
    public String trustIndex(Model model) {
    	XinTuoCpCtrlModel ctrlModel = new XinTuoCpCtrlModel();
    	ctrlModel.setFormat(true);
        //查询前面四个
    	List<ProductXtcp> lstTopVos = iProductXtService.selectProductXtcpTrustTopIndex(ctrlModel);
        //下面按类型查询 ,小型
    	ProductXtcp productXtcp =ctrlModel.getProductXtcp(); 
    	productXtcp.setXtcpXtlx("10");
    	List<ProductXtcp> lstTopfootSmalls =iProductXtService.selectProductXtcpTrustFootIndex(ctrlModel);
    	
    	 //下面按类型查询 ,小型
    	productXtcp.setXtcpXtlx("20");
    	List<ProductXtcp> lstTopfootOnes =iProductXtService.selectProductXtcpTrustFootIndex(ctrlModel);
    	
    	 //下面按类型查询 ,一年
    	productXtcp.setXtcpXtlx("30");
    	List<ProductXtcp> lstTopfootHighs =iProductXtService.selectProductXtcpTrustFootIndex(ctrlModel);
    	
    	
    	 //下面按类型查询 
    	productXtcp.setXtcpXtlx("40");
    	List<ProductXtcp> lstTopfootOthers =iProductXtService.selectProductXtcpTrustFootIndex(ctrlModel);
    	
    	model.addAttribute("lstTopVos", lstTopVos);
    	model.addAttribute("lstTopfootSmalls", lstTopfootSmalls);
    	model.addAttribute("lstTopfootOnes", lstTopfootOnes);
    	model.addAttribute("lstTopfootHighs", lstTopfootHighs);
    	model.addAttribute("lstTopfootOthers", lstTopfootOthers);  	  	
        return "web/xintuo/trustIndex";
    }
    
    /**
     * 查询信托产品
     * @param model
     * @param xinTuoSeachCtrlVO
     * @return
     */
    @RequestMapping("/trustProduct")
    public String trustProduct(Model model,XinTuoSeachCtrlVO xinTuoSeachCtrlVO) {
    	
    	
    	
    	XinTuoCpCtrlModel ctrlModel = new XinTuoCpCtrlModel();
    	ctrlModel.setFormat(true);
        //查询前面四个
    	List<ProductXtcp> lstTopVos = iProductXtService.selectProductXtcpTrustTopIndex(ctrlModel);
    	model.addAttribute("lstTopVos", lstTopVos);
    	
    	//查询信托公司
    	XinTuoGsCtrlModel xintuoGsCtrlModel = new XinTuoGsCtrlModel();
    	xintuoGsCtrlModel.setPageNo(1);
    	xintuoGsCtrlModel.setPageSize(Integer.MAX_VALUE);
    	List<ProductXtgs> lstProductXtgs =  iProductgsService.selectProductXtgs(xintuoGsCtrlModel);
    	model.addAttribute("lstProductXtgs", lstProductXtgs);
    	
    	//分页数据
    	//设置每页16条数据,前后台保持一致
    	xinTuoSeachCtrlVO.setPageSize(12);
    	
    	//把前途对象转换成后台，方便后面分开部署
    	com.tjs.admin.xintuo.controller.XinTuoSeachCtrlVO  xinTuoAdminSeachCtrlVO =
    			new com.tjs.admin.xintuo.controller.XinTuoSeachCtrlVO();
    	try {
			BeanUtils.copyProperties(xinTuoAdminSeachCtrlVO, xinTuoSeachCtrlVO);
		} catch (Exception e) {
	      e.printStackTrace();
		} 
    	
    	//设置总条数
    	int totalcount = iProductXtService.countProductXtcpTrust(xinTuoAdminSeachCtrlVO);
    	xinTuoSeachCtrlVO.setTotalCount(totalcount); 
    	
    	//判断请求页
        int totalPageNO = xinTuoSeachCtrlVO.getTotalPageSize();//总页数
        int currentPageNo = 1;//当前页
        if(xinTuoSeachCtrlVO.getPageNo()<1){//如果请求的页数小于1，设置成第一页
        	currentPageNo =1;
        } else if(xinTuoSeachCtrlVO.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	currentPageNo =totalPageNO;
        }else{
        	currentPageNo = xinTuoSeachCtrlVO.getPageNo();
        }
        
    	xinTuoAdminSeachCtrlVO.setPageNo(currentPageNo);
    	xinTuoSeachCtrlVO.setPageNo(currentPageNo);
    	
    	List<ProductXtcp> lstProductVos= iProductXtService.selectProductXtcpTrust(xinTuoAdminSeachCtrlVO);    	
    	//分页结束
    	model.addAttribute("xintuoSearVO", xinTuoSeachCtrlVO);
    	model.addAttribute("lstProductVos", lstProductVos);
        return "web/xintuo/trustProduct";
    }
    
    
    /**
     * 查询信托公司列表
     * @param model
     * @param xinTuoSeachCtrlVO
     * @return
     */
    @RequestMapping("/trustCompany")
    public String trustCompany(Model model,XinTuoGsCtrlModel xintuoGsCtrlModel) {    	
    	//公司列表推荐为四个   	
    	List<ProductXtgs> productXtgs = iProductgsService.selectProductXtgsIndex();
    	model.addAttribute("productXtgsIndex", productXtgs);
    	
    	//查询列表
    	xintuoGsCtrlModel.getProductXtgs().setXgtsStatus("20");
    	   	
    	int totalcount = iProductgsService.countProductXtgs(xintuoGsCtrlModel);
    	xintuoGsCtrlModel.setTotalCount(totalcount);
		 int totalPageNO = xintuoGsCtrlModel.getTotalPageSize();//总页数
	     if(xintuoGsCtrlModel.getPageNo()<1){//如果请求的页数小于1，设置成第一页
	    	 xintuoGsCtrlModel.setPageNo(1);
	     } else if(xintuoGsCtrlModel.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
	    	 xintuoGsCtrlModel.setPageNo(totalPageNO);
	     }
	     List<ProductXtgs> lstProductXtgs =  iProductgsService.selectProductXtgs(xintuoGsCtrlModel);
	     
	     model.addAttribute("lstProductXtgs", lstProductXtgs);
	     
    	model.addAttribute("xintuoGsCtrlModel", xintuoGsCtrlModel);
    	
    	return "web/xintuo/trustCompany";
    }
    
    
    /**
     * 查询公司简介
     * @param model
     * @param xinTuoSeachCtrlVO
     * @return
     */
    @RequestMapping("/companyProfile")
    public String companyProfile(Model model,@RequestParam(value="id",required=false) Long xtgsId) {
    	ProductXtgs  productXtgs = iProductgsService.findByProductXtgsId(xtgsId);
    	BigDecimal div10000 = new BigDecimal(10000);		
    	productXtgs.setXgtsZczb(BigDecimalUtils.div(productXtgs.getXgtsZczb(), div10000));
	
    	 model.addAttribute("productXtgs", productXtgs);    	 
    	 List<ProductXtcp> lstProductXtcp  = iProductXtService.selectProductXtcpByGsId(xtgsId);
    	 model.addAttribute("lstProductXtcp", lstProductXtcp);
    	 
    	return "web/xintuo/companyProfile";
    }
    
    
    /**
     * 查询信托产品简介
     * @param model
     * @param xinTuoSeachCtrlVO
     * @return
     */
    @RequestMapping("/trustParticulars")
    public String trustParticulars(Model model,@RequestParam(value="id",required=false) Long xtcpId) {
    	ProductXtcp productXtcp = iProductXtService.findByProductXtcpId(xtcpId);
    	BigDecimal div10000 = new BigDecimal(10000);		
    	productXtcp.setXtcpFxgm(BigDecimalUtils.div(productXtcp.getXtcpFxgm(), div10000));
    	productXtcp.setXtcpZdrgje(BigDecimalUtils.div(productXtcp.getXtcpZdrgje(), div10000));
    	
    	 model.addAttribute("productXtcp", productXtcp);
    	return "web/xintuo/trustParticulars";
    }
    
    
    /**
     * 查询安全保障也
     * @param model
     * @param xinTuoSeachCtrlVO
     * @return
     */
    @RequestMapping("/trustSafeguard")
    public String trustSafeguard() {
    	return "web/xintuo/trustSafeguard";
    }
    
   /**
    * 
    * @return
    */
    @RequestMapping("/orderProduct")
    @ResponseBody
    public Map<String, String> orderProduct(@RequestParam(value="productId",required=false) Long productId,@RequestParam(value="productType") String productType,@RequestParam(value="alert_name") String userName,@RequestParam(value="alert_tel") String  userTel) {
    	Order order = new Order();
    	order.setCreateDate(new Date());
    	//未处理
    	order.setOperateStatus("10");
    	order.setProductType(productType);
    	order.setProductId(productId);
    	if(productId!=null){
    		ProductXtcp productXtcp = iProductXtService.findByProductXtcpId(productId);
    		order.setProductName(productXtcp.getXtcpSplname());
    	}   	
    	order.setTelphone(userTel);;
    	order.setUserName(userName);    	
//    	Subject subject = SecurityUtils.getSubject();
//	     if(subject!=null){
//	    	 User user= iUserService.selectByUsername( (String)subject.getPrincipal());
//	    	 order.setUserID(user!=null?user.getId():null);
//	     }
    	    			 
    	iOrderService.insertOrder(order);
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("result", "true");
    	return result;
    }
  
}
