package com.tjs.admin.zhifu.dao;

import java.util.List;

import com.tjs.admin.zhifu.controller.CustomerFundCtrlModel;
import com.tjs.admin.zhifu.model.CustomerFund;

public interface CustomerFundMapper {
	
    /**插入个人账户*/
	public int  insertCustomerFund(CustomerFund customerFund);
		
	/**根据主键删除个人账户*/
	public void deleteCustomerFund(Long bankId);
		
	/**统计个人账户*/
	public int countCustomerFund(CustomerFundCtrlModel customerFundCtrlModel);
	    
	/**个人账户记录*/
	public List<CustomerFund> selectCustomerFund(CustomerFundCtrlModel customerFundCtrlModel);
	    
	/**根据ID找到个人账户*/
    public CustomerFund findByCustomerFundId(Long customerFundId);
       
    /**更新个人账户*/
	public int updateCustomerFund(CustomerFund customerFund);
	
	
}
