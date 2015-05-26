package com.tjs.admin.pe.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEProduct;
import com.tjs.admin.pe.service.PEProductService;
import com.tjs.admin.utils.StringUtils;
import com.tjs.admin.xintuo.model.Lable;
import com.tjs.admin.xintuo.model.ProductXtgs;

/**
 * 私募产品控制器
 * 
 *@author zhsoft
 *@since 2015年3月31日
 **/

@Controller
@RequestMapping(value = "/admin/pe/peProduct")
public class PEProductController {

	@Resource
	private PEProductService peProductService;
	
	
	@RequestMapping("/index")
    public String index(PEProductCtrlModel peProductCtrlModel, Model model) {
        return "admin/pe/peProduct/index";
    }
	
	@RequestMapping("/insert")
    public String insert(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
    	model.addAttribute("peProduct", peProduct);
    	model.addAttribute("ctrlData", peProductCtrlModel);
        return "admin/pe/peProduct/main";
    }
	

    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = peProductService.insertPEProduct(peProduct, peProductCtrlModel);
    	result.put("code", "0");
    	result.put("bizData", peProduct);
    	
        return result;
    }
	
	
	@RequestMapping("/listData")
    public String listData(PEProductCtrlModel peProductCtrlModel, Model model) throws UnsupportedEncodingException {
		if(StringUtils.isNotBlank(peProductCtrlModel.getKeyWord())){
    		String paramsTrans = new String(peProductCtrlModel.getKeyWord().getBytes("ISO-8859-1"),"UTF-8");
    		peProductCtrlModel.setKeyWord(java.net.URLDecoder.decode(paramsTrans , "UTF-8"));
    	}
		
    	List<PEProduct> showData = new ArrayList<PEProduct>();
    	showData = peProductService.getPEProductList(peProductCtrlModel);
    	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", peProductCtrlModel);
    	
        return "admin/pe/peProduct/listData";
    }
	
	@RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount(PEProductCtrlModel peProductCtrlModel) {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	Integer total = peProductService.selectListCount(peProductCtrlModel);
    	
    	result.put("total", total);
    	
        return result;
    }
	
	@RequestMapping("/update")
    public String update(PEProduct paraPEProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
		PEProduct peProduct = peProductService.getPEProductById(paraPEProduct.getId());
    	model.addAttribute("peProduct", peProduct);
    	model.addAttribute("ctrlData", peProductCtrlModel);
        return "admin/pe/peProduct/update";
    }
	
	@RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(PEProduct peProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = peProductService.updatePEProduct(peProduct, peProductCtrlModel);               
    	result.put("code", "0");
    	result.put("bizData", peProduct);
    	
        return result;
    }

    @RequestMapping("/view")
    public String view(PEProduct paraPEProduct, PEProductCtrlModel peProductCtrlModel, Model model) {
    	PEProduct peProduct = peProductService.getPEProductById(paraPEProduct.getId());
    	model.addAttribute("peProduct", peProduct);
    	model.addAttribute("ctrlData", peProductCtrlModel);
        return "admin/pe/peProduct/view";
    }
    
    @RequestMapping("/getOnLinePECompanyList")
    @ResponseBody
    public  Map<String, Object> getOnLinePECompanyList() {
    	Map<String, Object> result = new HashMap<String, Object>();
    	result = peProductService.getOnLinePECompanyList(); 
        return result;
    }
    
    @RequestMapping("getOnLinePEManagerList")
    @ResponseBody
    public  Map<String, Object> getOnLinePEManagerList(@RequestParam(value="companyId",required=false) Long companyId, @RequestParam(value="keyword",required=false) String keyword) {
    	
    	Map<String, Object> result = new HashMap<String, Object>();    	
    	List<PEManager> lstPeManager =  peProductService.selectOnLinePEManager(companyId,keyword);     	
    	 result.put("total", lstPeManager!=null?lstPeManager.size():0);
    	 List<Lable> lstLable = new ArrayList<Lable>();
    	 for(PEManager peManager:lstPeManager){
     		Lable lable = new Lable();
     		lable.setId(peManager.getId().toString());
     		lable.setTitle(peManager.getCompanyName()+":"+peManager.getName());
     		lstLable.add(lable);
     	} 
     	  result.put("data", lstLable);   	
         return result;
    }
}
