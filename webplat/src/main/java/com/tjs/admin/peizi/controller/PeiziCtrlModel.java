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
	
	private int totalPageSize;
	 
	private String notEqualoperaStatus;

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
		return (this.getPageNo()-1)*this.getPageSize();
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

	public String getNotEqualoperaStatus() {
		return notEqualoperaStatus;
	}

	public void setNotEqualoperaStatus(String notEqualoperaStatus) {
		this.notEqualoperaStatus = notEqualoperaStatus;
	}
	
	

}
