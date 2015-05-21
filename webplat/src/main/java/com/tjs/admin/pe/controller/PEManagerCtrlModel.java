package com.tjs.admin.pe.controller;

import com.tjs.admin.pe.model.PEManager;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 私募经理控制模型
 * 
 *@author zhsoft
 *@since 2015年4月21日
 **/
public class PEManagerCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private int limitStart;
	
	private PEManager peManager;
	
	private int totalPageSize;

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public PEManager getPeManager() {
		return peManager;
	}

	public void setPeManager(PEManager peManager) {
		this.peManager = peManager;
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
