package com.tjs.admin.zhifu.controller;

import com.tjs.admin.zhifu.model.Withdraw;
import com.tjs.core.generic.GenericCtrlModel;

public class WithdrawCtrlModel  extends GenericCtrlModel{
	
	private String keyWord;
	
	private int limitStart;
		
	private Withdraw withdraw;
	
	private int totalPageSize;
				
	public Withdraw getWithdraw() {
		if(withdraw==null){
			withdraw = new Withdraw();
		}
		return withdraw;
	}

	public void setWithdraw(Withdraw withdraw) {
		this.withdraw = withdraw;
	}

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
