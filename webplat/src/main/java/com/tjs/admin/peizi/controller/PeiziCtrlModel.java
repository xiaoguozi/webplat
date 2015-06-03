package com.tjs.admin.peizi.controller;

import com.tjs.admin.peizi.model.Peizi;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 配资
 * 
 *@author zhsoft
 *@since 2015年4月1日
 **/
public class PeiziCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private int limitStart;
		
	private Peizi peizi;

	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	public Peizi getPeizi() {		
		if(peizi==null){
			peizi = new Peizi();
		}
		return peizi;
	}

	public void setPeizi(Peizi peizi) {
		this.peizi = peizi;
	}

	public int getLimitStart() {
		return limitStart;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

}
