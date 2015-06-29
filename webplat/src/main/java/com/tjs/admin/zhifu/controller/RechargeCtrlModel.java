package com.tjs.admin.zhifu.controller;

import com.tjs.admin.zhifu.model.Recharge;
import com.tjs.core.generic.GenericCtrlModel;

public class RechargeCtrlModel extends GenericCtrlModel  {

	private String keyWord;
	
	private int limitStart;
		
	private Recharge recharge;
	
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

	public Recharge getRecharge() {
		if(recharge==null){
			recharge = new Recharge();
		}
		return recharge;
	}

	public void setRecharge(Recharge recharge) {
		this.recharge = recharge;
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
