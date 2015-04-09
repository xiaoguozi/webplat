package com.tjs.admin.xintuo.model;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

/**
 * 信托公司
 * 
 * @author StarZou
 * @since 2014年7月5日 下午12:07:20
 **/
public class ProductXtgs {
	/**流水号*/
	private Long  xtgsId;
	/**公司编码*/
	private String xtgsCode;
	/**公司LOGO*/
	private String xtgsLog;
	/**公司中文名称*/
	private String xgtsZhname;
	/**公司英文名称 */
	private String xgtsEnname;
	/**公司简称*/
	private String xgtsSplname;
	/**成立日期*/
	 @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date  xgtsCreatedate;
	/**注册资本*/ 
	 @NumberFormat(style=Style.CURRENCY)
	private BigDecimal xgtsZczb;
	/**所在城市*/
	private String xgtsCity;
	/**董事长*/
	private String xgtsGsz;
	/**总经理*/
	private String xgtsZjl;
	/**法人代表*/
	private String xgtsFrdb;
	/**大股东*/
	private String xgtsDgd;
	/**是否上市*/
	private String xgtsSs;
	/**公司性质*/
	private String xgtsGsxz;
	/**资产管理规模*/
	private String xgtsZcglgm;
	/**公司简介*/
	private String xgtsGsjj;
	
	/**公司推荐位*/
	private String xgtsTjw;
	
	/**推荐序号*/
	private Long xgtsTjno;	
	/**状态*/
	private String xgtsStatus;
	
	public String getXgtsTjw() {
		return xgtsTjw;
	}
	public void setXgtsTjw(String xgtsTjw) {
		this.xgtsTjw = xgtsTjw;
	}
	public Long getXgtsTjno() {
		return xgtsTjno;
	}
	public void setXgtsTjno(Long xgtsTjno) {
		this.xgtsTjno = xgtsTjno;
	}
	public String getXgtsStatus() {
		return xgtsStatus;
	}
	public void setXgtsStatus(String xgtsStatus) {
		this.xgtsStatus = xgtsStatus;
	}
	public Long getXtgsId() {
		return xtgsId;
	}
	public void setXtgsId(Long xtgsId) {
		this.xtgsId = xtgsId;
	}
	public String getXtgsCode() {
		return xtgsCode;
	}
	public void setXtgsCode(String xtgsCode) {
		this.xtgsCode = xtgsCode;
	}
	public String getXtgsLog() {
		return xtgsLog;
	}
	public void setXtgsLog(String xtgsLog) {
		this.xtgsLog = xtgsLog;
	}
	public String getXgtsZhname() {
		return xgtsZhname;
	}
	public void setXgtsZhname(String xgtsZhname) {
		this.xgtsZhname = xgtsZhname;
	}
	public String getXgtsEnname() {
		return xgtsEnname;
	}
	public void setXgtsEnname(String xgtsEnname) {
		this.xgtsEnname = xgtsEnname;
	}
	public String getXgtsSplname() {
		return xgtsSplname;
	}
	public void setXgtsSplname(String xgtsSplname) {
		this.xgtsSplname = xgtsSplname;
	}
	public Date getXgtsCreatedate() {
		return xgtsCreatedate;
	}
	public void setXgtsCreatedate(Date xgtsCreatedate) {
		this.xgtsCreatedate = xgtsCreatedate;
	}
	public BigDecimal getXgtsZczb() {
		return xgtsZczb;
	}
	public void setXgtsZczb(BigDecimal xgtsZczb) {
		this.xgtsZczb = xgtsZczb;
	}
	public String getXgtsCity() {
		return xgtsCity;
	}
	public void setXgtsCity(String xgtsCity) {
		this.xgtsCity = xgtsCity;
	}
	public String getXgtsGsz() {
		return xgtsGsz;
	}
	public void setXgtsGsz(String xgtsGsz) {
		this.xgtsGsz = xgtsGsz;
	}
	public String getXgtsZjl() {
		return xgtsZjl;
	}
	public void setXgtsZjl(String xgtsZjl) {
		this.xgtsZjl = xgtsZjl;
	}
	public String getXgtsFrdb() {
		return xgtsFrdb;
	}
	public void setXgtsFrdb(String xgtsFrdb) {
		this.xgtsFrdb = xgtsFrdb;
	}
	public String getXgtsDgd() {
		return xgtsDgd;
	}
	public void setXgtsDgd(String xgtsDgd) {
		this.xgtsDgd = xgtsDgd;
	}
	public String getXgtsSs() {
		return xgtsSs;
	}
	public void setXgtsSs(String xgtsSs) {
		this.xgtsSs = xgtsSs;
	}
	public String getXgtsGsxz() {
		return xgtsGsxz;
	}
	public void setXgtsGsxz(String xgtsGsxz) {
		this.xgtsGsxz = xgtsGsxz;
	}
	public String getXgtsZcglgm() {
		return xgtsZcglgm;
	}
	public void setXgtsZcglgm(String xgtsZcglgm) {
		this.xgtsZcglgm = xgtsZcglgm;
	}
	public String getXgtsGsjj() {
		return xgtsGsjj;
	}
	public void setXgtsGsjj(String xgtsGsjj) {
		this.xgtsGsjj = xgtsGsjj;
	}
	
	

}
