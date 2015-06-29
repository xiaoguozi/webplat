package com.tjs.admin.zhifu.controller;

import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.core.generic.GenericCtrlModel;

public class CustomerFundCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private int limitStart;
		
	private CustomerFund customerFund;
	
	private int totalPageSize;

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public int getLimitStart() {
		return (this.getPageNo()-1)*this.getPageSize();
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}
	
	public CustomerFund getCustomerFund() {
		if(customerFund==null){
			customerFund = new CustomerFund();
		}
		return customerFund;
	}

	public void setCustomerFund(CustomerFund customerFund) {
		this.customerFund = customerFund;
	}

	
	public int getTotalPageSize() {
		if(super.getTotalCount()%super.getPageSize()==0){
			return super.getTotalCount()/super.getPageSize();
		}else{
			return super.getTotalCount()/super.getPageSize()+1;
		}
	}

	public void setTotalPageSize(int totalPageSize) {
		this.totalPageSize = totalPageSize;
	}
	
}
