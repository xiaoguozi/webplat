package com.tjs.admin.xintuo.model;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

/**
 * 信托产品
 * 
 * @author StarZou
 * @since 14年7月5日 下午1:7:
 **/
public class ProductXtcp {
    /**信托产品流水号 */
	private Long xtcpId;
	/**信托产品LOGO */
    private String 	  xtcpLog;
    /** 信托全称*/
    private String  xtcpFullname;
    /**信托公司名称 */
    private String  xtcpGszhname;
    /**信托公司ID */
    private Long  xtcpGsId;
    /**预计发行规模 */
    private String  xtcpFxgm;
    /**预期年收益率 */
    private String  xtcpNsyl;
    /**利息分配 */
    private String  xtcpLxfp;
    /** 存续期*/
    private String  xtcpCxq;
    /**信托类型 */
    private String  xtcpXtlx;
    /**最低认购金额 */
    @NumberFormat(style=Style.CURRENCY)
    private BigDecimal  xtcpZdrgje;
    /**抵押率 */
    @NumberFormat(style=Style.CURRENCY)
    private BigDecimal  xtcpDyl;
    /**投资领域 */
    private String  xtcpTzly;
    /**抵押物 */
    private String  xtcpDyw;
    /** 收益说明*/
    private String  xtcpSysm;
    /**募集进度/账号 */
    private String  xtcpMjzh;
    /**融资方 */
    private String  xtcpRzf;
    /**资金用途 */
    private String  xtcpZjyt;   
    /**还款来源 */
    private String  xtcpHkly;
    /**风控措施 */
    private String  xtcpFkcs;
    /**资产管理人 */
    private String  xtcpZcglr;
    /** 点评*/
    private String  xtcpDp;
    /**是否发布1：发布，没有发布 */
    private String  xtcpFb;
    /**是否在首页显示1：显示，：不显示 */
    private String  xtcpInshow;
    /** 产品上架时间*/
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date  xtcpCreateDate;
    /**产品修改时间 */
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date   xtcpModifyDate;
    /**创建人Id */
    private Long  xtcpUserId;
    /**创建人name */
    private String  xtcpUsername;
    
    
    public Long getXtcpId() {
		return xtcpId;
	}
	public void setXtcpId(Long xtcpId) {
		this.xtcpId = xtcpId;
	}
	public String getXtcpLog() {
		return xtcpLog;
	}
	public void setXtcpLog(String xtcpLog) {
		this.xtcpLog = xtcpLog;
	}
	public String getXtcpFullname() {
		return xtcpFullname;
	}
	public void setXtcpFullname(String xtcpFullname) {
		this.xtcpFullname = xtcpFullname;
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
	public String getXtcpFxgm() {
		return xtcpFxgm;
	}
	public void setXtcpFxgm(String xtcpFxgm) {
		this.xtcpFxgm = xtcpFxgm;
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
	public String getXtcpCxq() {
		return xtcpCxq;
	}
	public void setXtcpCxq(String xtcpCxq) {
		this.xtcpCxq = xtcpCxq;
	}
	public String getXtcpXtlx() {
		return xtcpXtlx;
	}
	public void setXtcpXtlx(String xtcpXtlx) {
		this.xtcpXtlx = xtcpXtlx;
	}
	public BigDecimal getXtcpZdrgje() {
		return xtcpZdrgje;
	}
	public void setXtcpZdrgje(BigDecimal xtcpZdrgje) {
		this.xtcpZdrgje = xtcpZdrgje;
	}
	public BigDecimal getXtcpDyl() {
		return xtcpDyl;
	}
	public void setXtcpDyl(BigDecimal xtcpDyl) {
		this.xtcpDyl = xtcpDyl;
	}
	public String getXtcpTzly() {
		return xtcpTzly;
	}
	public void setXtcpTzly(String xtcpTzly) {
		this.xtcpTzly = xtcpTzly;
	}
	public String getXtcpDyw() {
		return xtcpDyw;
	}
	public void setXtcpDyw(String xtcpDyw) {
		this.xtcpDyw = xtcpDyw;
	}
	public String getXtcpSysm() {
		return xtcpSysm;
	}
	public void setXtcpSysm(String xtcpSysm) {
		this.xtcpSysm = xtcpSysm;
	}
	public String getXtcpMjzh() {
		return xtcpMjzh;
	}
	public void setXtcpMjzh(String xtcpMjzh) {
		this.xtcpMjzh = xtcpMjzh;
	}
	public String getXtcpRzf() {
		return xtcpRzf;
	}
	public void setXtcpRzf(String xtcpRzf) {
		this.xtcpRzf = xtcpRzf;
	}
	public String getXtcpZjyt() {
		return xtcpZjyt;
	}
	public void setXtcpZjyt(String xtcpZjyt) {
		this.xtcpZjyt = xtcpZjyt;
	}
	public String getXtcpHkly() {
		return xtcpHkly;
	}
	public void setXtcpHkly(String xtcpHkly) {
		this.xtcpHkly = xtcpHkly;
	}
	public String getXtcpFkcs() {
		return xtcpFkcs;
	}
	public void setXtcpFkcs(String xtcpFkcs) {
		this.xtcpFkcs = xtcpFkcs;
	}
	public String getXtcpZcglr() {
		return xtcpZcglr;
	}
	public void setXtcpZcglr(String xtcpZcglr) {
		this.xtcpZcglr = xtcpZcglr;
	}
	public String getXtcpDp() {
		return xtcpDp;
	}
	public void setXtcpDp(String xtcpDp) {
		this.xtcpDp = xtcpDp;
	}
	public String getXtcpFb() {
		return xtcpFb;
	}
	public void setXtcpFb(String xtcpFb) {
		this.xtcpFb = xtcpFb;
	}
	public String getXtcpInshow() {
		return xtcpInshow;
	}
	public void setXtcpInshow(String xtcpInshow) {
		this.xtcpInshow = xtcpInshow;
	}
	public Date getXtcpCreateDate() {
		return xtcpCreateDate;
	}
	public void setXtcpCreateDate(Date xtcpCreateDate) {
		this.xtcpCreateDate = xtcpCreateDate;
	}
	public Date getXtcpModifyDate() {
		return xtcpModifyDate;
	}
	public void setXtcpModifyDate(Date xtcpModifyDate) {
		this.xtcpModifyDate = xtcpModifyDate;
	}
	public Long getXtcpUserId() {
		return xtcpUserId;
	}
	public void setXtcpUserId(Long xtcpUserId) {
		this.xtcpUserId = xtcpUserId;
	}
	public String getXtcpUsername() {
		return xtcpUsername;
	}
	public void setXtcpUsername(String xtcpUsername) {
		this.xtcpUsername = xtcpUsername;
	}
	
    
    
    
}
