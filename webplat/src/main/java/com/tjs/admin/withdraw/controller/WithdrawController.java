package com.tjs.admin.withdraw.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.model.User;
import com.tjs.admin.model.UserInfo;
import com.tjs.admin.service.UserInfoService;
import com.tjs.admin.service.UserService;
import com.tjs.admin.utils.ExcelUtils;
import com.tjs.admin.utils.ExportMo;
import com.tjs.admin.utils.StringUtils;
import com.tjs.admin.withdraw.service.IWithdrawBizService;
import com.tjs.admin.zhifu.controller.WithdrawCtrlModel;
import com.tjs.admin.zhifu.model.Withdraw;
import com.tjs.admin.zhifu.service.IWithdraw;
import com.tjs.admin.zhifu.zfenum.WithdrawEnum;

/**
 * 
 * @author 何志刚
 * @since 2015年3月21日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/admin/withdraw")
public class WithdrawController {
 
	@Resource
	IWithdraw withdrawService;
	@Resource
	IWithdrawBizService withdrawBizService;
	@Resource
	private UserService userService;	 
	@Resource
	private UserInfoService UserInfoService;
	
	@RequestMapping("/withdrawIndex")
    public String xtgsIndex() {
        return "admin/withdraw/withdrawIndex";
    }
    
    @RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount(WithdrawCtrlModel withdrawCtrlModel, Model model) throws UnsupportedEncodingException{
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	if(StringUtils.isNotBlank(withdrawCtrlModel.getKeyWord())){
    		String paramsTrans = new String(withdrawCtrlModel.getKeyWord().getBytes("ISO-8859-1"),"UTF-8");
    		withdrawCtrlModel.setKeyWord(java.net.URLDecoder.decode(paramsTrans , "UTF-8"));
    	}
    	
    	int icount = withdrawService.countWithdraw(withdrawCtrlModel);
    	   	
    	result.put("total", icount);
    	
        return result;
    }

    
    @RequestMapping("/listData")
    public String listData(WithdrawCtrlModel withdrawCtrlModel, Model model) throws UnsupportedEncodingException {
    	
    	if(StringUtils.isNotBlank(withdrawCtrlModel.getKeyWord())){
    		String paramsTrans = new String(withdrawCtrlModel.getKeyWord().getBytes("ISO-8859-1"),"UTF-8");
    		withdrawCtrlModel.setKeyWord(java.net.URLDecoder.decode(paramsTrans , "UTF-8"));
    	}
    	
    	List<Withdraw> lstWithdraw = withdrawService.selectWithdraw(withdrawCtrlModel);
    	model.addAttribute("showData", lstWithdraw);
		model.addAttribute("ctrlData", withdrawCtrlModel);
    	
        return "admin/withdraw/withdrawListData";
    }
    
    @RequestMapping("/update")
    public String update(@RequestParam(value="id",required=false) Long withrowId, WithdrawCtrlModel withdrawCtrlModel, Model model) {
    	Withdraw withdraw = withdrawService.findByWithdrawId(withrowId);
    	model.addAttribute(withdraw);
    	model.addAttribute("ctrlData", withdrawCtrlModel);
        return "admin/withdraw/updateWithdraw";
    }
    
  

    @RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(Withdraw withdraw, WithdrawCtrlModel withdrawCtrlModel, Model model) {  	
    	Map<String, Object> result = new HashMap<String, Object>();
    	
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();		
		User user = userService.selectByUsername(username);
		UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
		String userName=userInfo==null?"":userInfo.getName();		
    	withdrawBizService.updateWithdraw(withdraw,userName);
    	result.put("code", "0");
    	result.put("bizData", withdrawCtrlModel);
        return result;
    }
    
    
    @RequestMapping("/cancelData")
    @ResponseBody
    public Map<String, Object> cancelData(Withdraw withdraw, WithdrawCtrlModel withdrawCtrlModel, Model model) {  	
    	Map<String, Object> result = new HashMap<String, Object>();
    	
    	Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();		
		User user = userService.selectByUsername(username);
		UserInfo userInfo = UserInfoService.findUserInfoByUserId(user.getId());
		String userName=userInfo==null?"":userInfo.getName();		
    	withdrawBizService.cancelWithdraw(withdraw,userName);
    	result.put("code", "0");
    	result.put("bizData", withdrawCtrlModel);
        return result;
    }
	
    
    @RequestMapping("/exportData")
    public String exportData(@RequestParam(value="ids",required=false) Long[] withrowIds ,HttpServletResponse response) throws IOException {  	      	
    	
    	 String  mimetype = "application/x-msdownload";
    	 response.setContentType(mimetype);
    	 String downFileName = "withdraw.xls";
    	 String inlineType = "attachment"; // 是否内联附件
    	 response.setHeader("Content-Disposition", inlineType+ ";filename=\"" + downFileName + "\"");
 	   
    	ExportMo exportMo = new ExportMo();
    	OutputStream os = response.getOutputStream();
    	
    	List<Withdraw> lstWithdraw = withdrawService.selectWithdrawByIds(withrowIds);
    	
		exportMo.setTableName("提现记录");
		List<String> lstColumns = new ArrayList<String>();
		lstColumns.add("withrowId");
		lstColumns.add("withrowId");
		lstColumns.add("createBy");
		lstColumns.add("cardNo");
		lstColumns.add("bankName");
		lstColumns.add("bankProvince");
		lstColumns.add("bankcity");
		lstColumns.add("amount");
		lstColumns.add("reason");
		lstColumns.add("bankFullName");		
		lstColumns.add("telNo");
		exportMo.setColumns(lstColumns);
		
		List<String> lstColumnsTitle = new ArrayList<String>();
		lstColumnsTitle.add("批次号");
		lstColumnsTitle.add("订单号");
		lstColumnsTitle.add("帐户名称");
		lstColumnsTitle.add("银行账号");
		lstColumnsTitle.add("开户银行");
		lstColumnsTitle.add("省");
		lstColumnsTitle.add("市");
		lstColumnsTitle.add("金额");
		lstColumnsTitle.add("打款原因");
		lstColumnsTitle.add("开户银行全称");
		lstColumnsTitle.add("手机号");		
		exportMo.setColumnTitles(lstColumnsTitle);
		
		exportMo.setValues(lstWithdraw);
		
		List<String> lstColumnsType = new ArrayList<String>();
		lstColumnsType.add("String");
		lstColumnsType.add("String");
		lstColumnsType.add("String");
		lstColumnsType.add("String");
		lstColumnsType.add("String");
		lstColumnsType.add("String");
		lstColumnsType.add("String");
		lstColumnsType.add("numberSize");
		lstColumnsType.add("String");
		lstColumnsType.add("String");
		lstColumnsType.add("String");
		exportMo.setColumnTypes(lstColumnsType);
		ExcelUtils.generateFile(os, exportMo);
        return null;
    }
}
