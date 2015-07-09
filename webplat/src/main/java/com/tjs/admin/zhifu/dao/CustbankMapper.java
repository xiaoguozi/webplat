package com.tjs.admin.zhifu.dao;

import java.util.List;

import com.tjs.admin.zhifu.controller.CustbankCtrlModel;
import com.tjs.admin.zhifu.model.Custbank;

public interface CustbankMapper {	
    /**插入银行卡*/
	public int  insertCustbank(Custbank custbank);
	
	/**根据主键删除银行卡*/
	public int deleteCustbank(Custbank custbank);
	
	/**银行卡数量数量*/
    public int countCustbank(CustbankCtrlModel custbankCtrlModel);
    
    /**银行卡记录*/
    public List<Custbank> selectCustbank(CustbankCtrlModel custbankCtrlModel);
    
    /**根据ID找到银行卡*/
	public Custbank findBybankId(Long bankId);
			
}
