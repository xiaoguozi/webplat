package com.tjs.wx.xintuo.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjs.admin.xintuo.controller.XinTuoSeachCtrlVO;
import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.admin.xintuo.service.IProductXtcpService;


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
    private IProductXtcpService productXtcpService;
    
	
	@Resource
	private IProductXtcpService iProductXtService;
	
    
	@RequestMapping("/index")
    public String index(Model model) {		
		List<ProductXtcp> lstXtcp =  productXtcpService.selectProductXtcpIndex();
		if(lstXtcp!=null&&lstXtcp.size()>0){
			model.addAttribute("xtcp", lstXtcp.get(0));
		}else{
			model.addAttribute("xtcp", new ProductXtcp());	
		}
        return "wx/xintuo/index";
    }
	
	@RequestMapping("/list")
    public String list(Model model,XinTuoSeachCtrlVO xinTuoSeachCtrlVO) {			
		//设置总条数
		xinTuoSeachCtrlVO.setPageSize(10);
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
        return "wx/xintuo/xintuolist";
    }
	
	@RequestMapping("/xintuoInfo")
    public String list() {				
        return "wx/xintuo/xintuoInfo";
    }
}
