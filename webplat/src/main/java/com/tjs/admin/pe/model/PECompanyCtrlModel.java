package com.tjs.admin.pe.model;

import com.tjs.core.generic.GenericCtrlModel;

/**
 * 私募公司控制模型
 * 
 *@author zhsoft
 *@since 2015年4月1日
 **/
public class PECompanyCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private PECompany peCompany;

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public PECompany getPeCompany() {
		return peCompany;
	}

	public void setPeCompany(PECompany peCompany) {
		this.peCompany = peCompany;
	}
	
	
}
