package com.tjs.web.xintuo.controller;

import com.tjs.core.generic.GenericCtrlModel;

/**
 * 查询条件VO
 * @author hezhigang
 *
 */
public class XinTuoSeachCtrlVO extends GenericCtrlModel {
    
	 private String keyword;
	 /**最低认购金额 */
	 private int xtcpZdrgje=0;
	 /** 存续期*/
	 private String xtcpCxq="0";
	 /**预期年收益率 */
	 private String xtcpNsyl="0";
	 /**利息分配 */
	 private String xtcpLxfp="0";
	 /**投资领域*/
	 private String xtcpTzly="0";
	 /** 所在区域*/
	 private String xtcpArea="0";	 
	 /**信托公司名称 */
	 private String  xtcpGszhname;
	 /**信托公司ID */
	 private Long  xtcpGsId;
	 
	 private int limitStart;
	 
	 private int totalPageSize;
	 
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
	 
	public int getLimitStart() {
		return limitStart;
	}
	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	public int getXtcpZdrgje() {
		return xtcpZdrgje;
	}
	public void setXtcpZdrgje(int xtcpZdrgje) {
		this.xtcpZdrgje = xtcpZdrgje;
	}
	public String getXtcpCxq() {
		return xtcpCxq;
	}
	public void setXtcpCxq(String xtcpCxq) {
		this.xtcpCxq = xtcpCxq;
	}
	public String getXtcpNsyl() {
		return xtcpNsyl;
	}
	public void setXtcpNsyl(String xtcpNsyl) {
		this.xtcpNsyl = xtcpNsyl;
	}
	public String getXtcpLxfp() {
		return xtcpLxfp;
	}
	public void setXtcpLxfp(String xtcpLxfp) {
		this.xtcpLxfp = xtcpLxfp;
	}
	public String getXtcpTzly() {
		return xtcpTzly;
	}
	public void setXtcpTzly(String xtcpTzly) {
		this.xtcpTzly = xtcpTzly;
	}
	public String getXtcpArea() {
		return xtcpArea;
	}
	public void setXtcpArea(String xtcpArea) {
		this.xtcpArea = xtcpArea;
	}
	public String getXtcpGszhname() {
		return xtcpGszhname;
	}
	public void setXtcpGszhname(String xtcpGszhname) {
		this.xtcpGszhname = xtcpGszhname;
	}
	public Long getXtcpGsId() {
		return xtcpGsId;
	}
	public void setXtcpGsId(Long xtcpGsId) {
		this.xtcpGsId = xtcpGsId;
	}
	 
	 
	  
}
