package com.tjs.admin.zhifu.controller;

import com.tjs.admin.zhifu.model.FundRecord;
import com.tjs.core.generic.GenericCtrlModel;

public class FundRecordCtrlModel  extends GenericCtrlModel  {
private String keyWord;
	
	private int limitStart;
		
	private FundRecord fundRecord;
	
	private int totalPageSize;

	public FundRecord getFundRecord() {
		if(fundRecord==null){
			fundRecord = new FundRecord();
		}
		return fundRecord;
	}

	public void setFundRecord(FundRecord fundRecord) {
		this.fundRecord = fundRecord;
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
