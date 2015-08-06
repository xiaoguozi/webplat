package com.tjs.admin.system.controller;

import com.tjs.admin.system.model.SysHome;
import com.tjs.core.generic.GenericCtrlModel;

public class BannerCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private int limitStart;
	
	private int totalPageSize;
	
	private SysHome sysHome;
	
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

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public int getLimitStart() {
		return limitStart;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

	public SysHome getSysHome() {
		if(sysHome==null){
			sysHome = new SysHome();
		}
		return sysHome;
	}

	public void setSysHome(SysHome sysHome) {
		this.sysHome = sysHome;
	}

	
}
