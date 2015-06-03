package com.tjs.admin.peizi.controller;

import com.tjs.admin.peizi.model.PeiziRule;
import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.core.generic.GenericCtrlModel;

/**
 * 配资
 * 
 *@author zhsoft
 *@since 2015年4月1日
 **/
public class PeiziRuleCtrlModel extends GenericCtrlModel {

	private String keyWord;
	
	private int limitStart;
		
	private PeiziRule peiziRule;

	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	
	public PeiziRule getPeiziRule() {
		if(peiziRule==null){
			peiziRule = new PeiziRule();
		}
		return peiziRule;
	}

	public void setPeiziRule(PeiziRule peiziRule) {
		this.peiziRule = peiziRule;
	}	
	
	public int getLimitStart() {
		return limitStart;
	}

	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}

}
