package com.tjs.web.pe.controller;

import com.tjs.core.generic.GenericCtrlModel;

/**
 * 查询条件VO
 * @author duanyujun
 *
 */
public class PESearchCtrlVO extends GenericCtrlModel {

	private String keyword;
	
	/** 基金经理 */
	private int peManagerId = 0;
	
	/** 基金公司 */
	private int peCompanyId = 0;
	
	/** 基金类型 */
	private int peType = 0;
	
	/** 年华收益率  */
	private int peYearRate = 0;
	
	/** 基金经理更多 */
	private int peManagerMore = 0;
	
	/** 基金公司更多 */
	private int peCompanyMore = 0;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPeManagerId() {
		return peManagerId;
	}

	public void setPeManagerId(int peManagerId) {
		this.peManagerId = peManagerId;
	}

	public int getPeCompanyId() {
		return peCompanyId;
	}

	public void setPeCompanyId(int peCompanyId) {
		this.peCompanyId = peCompanyId;
	}

	public int getPeType() {
		return peType;
	}

	public void setPeType(int peType) {
		this.peType = peType;
	}

	public int getPeYearRate() {
		return peYearRate;
	}

	public void setPeYearRate(int peYearRate) {
		this.peYearRate = peYearRate;
	}

	public int getPeManagerMore() {
		return peManagerMore;
	}

	public void setPeManagerMore(int peManagerMore) {
		this.peManagerMore = peManagerMore;
	}

	public int getPeCompanyMore() {
		return peCompanyMore;
	}

	public void setPeCompanyMore(int peCompanyMore) {
		this.peCompanyMore = peCompanyMore;
	}
	
	
	
}
