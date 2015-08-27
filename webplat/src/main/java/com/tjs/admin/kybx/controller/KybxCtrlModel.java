package com.tjs.admin.kybx.controller;

import com.tjs.admin.kybx.model.Kybx;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 信托公司
 * 
 *@author zhsoft
 *@since 2015年4月1日
 **/
public class KybxCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private int limitStart;
	
	private boolean isFormat=true;
	
	public boolean isFormat() {
		return isFormat;
	}

	public void setFormat(boolean isFormat) {
		this.isFormat = isFormat;
	}

	public int getLimitStart() {
		return (this.getPageNo()-1)*this.getPageSize();
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

	private Kybx kybx;

	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public Kybx getKybx() {
		if(kybx==null){
			kybx = new Kybx();
		}
		return kybx;
	}

	public void setKybx(Kybx kybx) {
		this.kybx = kybx;
	}		
}
