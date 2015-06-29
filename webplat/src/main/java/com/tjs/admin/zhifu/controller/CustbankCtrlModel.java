package com.tjs.admin.zhifu.controller;

import com.tjs.admin.zhifu.model.Custbank;
import com.tjs.core.generic.GenericCtrlModel;

public class CustbankCtrlModel extends GenericCtrlModel {	
	private String keyWord;
	
	private int limitStart;
		
	private Custbank custbank;
	
	private int totalPageSize;

	public Custbank getCustbank() {
		if(custbank==null){
			custbank = new Custbank();
		}
		return custbank;
	}

	public void setCustbank(Custbank custbank) {
		this.custbank = custbank;
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
