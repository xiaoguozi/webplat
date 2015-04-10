package com.tjs.admin.pe.model;

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
	private String durationIncome;
	
	/** 行业平均 */
	private String industryAverage;
	
	/** 沪深300 */
	private String hs300;
	
	/** 排名 */
	private String rank;
	
	/** 排名区间 */
	private String rankInterval;
	
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

	public String getDurationIncome() {
		return durationIncome;
	}

	public void setDurationIncome(String durationIncome) {
		this.durationIncome = durationIncome;
	}

	public String getIndustryAverage() {
		return industryAverage;
	}

	public void setIndustryAverage(String industryAverage) {
		this.industryAverage = industryAverage;
	}

	public String getHs300() {
		return hs300;
	}

	public void setHs300(String hs300) {
		this.hs300 = hs300;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getRankInterval() {
		return rankInterval;
	}

	public void setRankInterval(String rankInterval) {
		this.rankInterval = rankInterval;
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
