package com.tjs.admin.pe.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 私募产品收益排名实体
 * 
 *@author zhsoft
 *@since 2015年4月10日
 **/
public class PEProductIncome {

	private long id;
	
	/** 年度 */
	private String year;
	
	/** 期间收益 */
	private BigDecimal durationIncome;
	
	/** 行业平均 */
	private BigDecimal industryAverage;
	
	/** 沪深300 */
	private BigDecimal hs300;
	
	/** 排名 */
	private String rank;
	
	/** 排名区间 */
	private BigDecimal rankInterval;
	
	/** 产品ID */
	private long productId;
	
	/** 产品名称 */
	private String productName;
	
	private long createrId;
	
	private String createrName;
	
	private Date createDate;
	
	private Date lastModifyDate;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public BigDecimal getDurationIncome() {
		return durationIncome;
	}

	public void setDurationIncome(BigDecimal durationIncome) {
		this.durationIncome = durationIncome;
	}

	public BigDecimal getIndustryAverage() {
		return industryAverage;
	}

	public void setIndustryAverage(BigDecimal industryAverage) {
		this.industryAverage = industryAverage;
	}

	public BigDecimal getHs300() {
		return hs300;
	}

	public void setHs300(BigDecimal hs300) {
		this.hs300 = hs300;
	}

	public BigDecimal getRankInterval() {
		return rankInterval;
	}

	public void setRankInterval(BigDecimal rankInterval) {
		this.rankInterval = rankInterval;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public long getCreaterId() {
		return createrId;
	}

	public void setCreaterId(long createrId) {
		this.createrId = createrId;
	}

	public String getCreaterName() {
		return createrName;
	}

	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getLastModifyDate() {
		return lastModifyDate;
	}

	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "PEProductIncome [id=" + id + ", year=" + year
				+ ", durationIncome=" + durationIncome + ", industryAverage="
				+ industryAverage + ", hs300=" + hs300 + ", rank=" + rank
				+ ", rankInterval=" + rankInterval + ", productId=" + productId
				+ ", productName=" + productName + ", createrId=" + createrId
				+ ", createrName=" + createrName + ", createDate=" + createDate
				+ ", lastModifyDate=" + lastModifyDate + "]";
	}

	
}
