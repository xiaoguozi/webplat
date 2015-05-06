package com.tjs.web.xintuo.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.xintuo.controller.XinTuoCpCtrlModel;
import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.admin.xintuo.service.IProductXtcpService;
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
    	
    	//分页数据
    	//设置每页16条数据,前后台保持一致
    	xinTuoSeachCtrlVO.setPageSize(8);
    	
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
        	xinTuoSeachCtrlVO.setPageNo(1);
        } else if(xinTuoSeachCtrlVO.getPageNo()>totalPageNO){//如果请求页大于总页数，设置成最后一页
        	xinTuoSeachCtrlVO.setPageNo(totalPageNO);
        }else{
        	currentPageNo = xinTuoSeachCtrlVO.getPageNo();
        }
        
    	xinTuoAdminSeachCtrlVO.setPageNo(currentPageNo);
    	xinTuoSeachCtrlVO.setPageNo(currentPageNo);
    	
    	System.err.println(">>>>>xtcpNsyl="+xinTuoAdminSeachCtrlVO.getXtcpNsyl()+"adsfa");
    	System.err.println(">>>>>xtcpLxfp="+xinTuoAdminSeachCtrlVO.getXtcpLxfp()+"adsfa");
    	System.err.println(">>>>>xtcpArea="+xinTuoAdminSeachCtrlVO.getXtcpArea()+"adsfa");
    	System.err.println(">>>>>xtcpTzly="+xinTuoAdminSeachCtrlVO.getXtcpTzly()+"adsfa");
    	List<ProductXtcp> lstProductVos= iProductXtService.selectProductXtcpTrust(xinTuoAdminSeachCtrlVO);    	
    	//分页结束
    	model.addAttribute("xintuoSearVO", xinTuoSeachCtrlVO);
    	model.addAttribute("lstProductVos", lstProductVos);
        return "web/xintuo/trustProduct";
    }
  
}
