package com.tjs.admin.pe.model;

import java.util.Date;

/**
 * 私募产品净值表
 * 
 *@author zhsoft
 *@since 2015年4月10日
 **/
public class PEProductNet {

	private long id;
	
	/** 净值时间 */
	private Date netTime;
	
	/**  单位净值 */
	private String unitNet;
	
	/**  累计净值 */
	private String totalNet;
	
	/**  增长率 */
	private String increaseRate;
	
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

	public Date getNetTime() {
		return netTime;
	}

	public void setNetTime(Date netTime) {
		this.netTime = netTime;
	}

	public String getUnitNet() {
		return unitNet;
	}

	public void setUnitNet(String unitNet) {
		this.unitNet = unitNet;
	}

	public String getTotalNet() {
		return totalNet;
	}

	public void setTotalNet(String totalNet) {
		this.totalNet = totalNet;
	}

	public String getIncreaseRate() {
		return increaseRate;
	}

	public void setIncreaseRate(String increaseRate) {
		this.increaseRate = increaseRate;
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

	@Override
	public String toString() {
		return "PEProductNet [id=" + id + ", netTime=" + netTime + ", unitNet="
				+ unitNet + ", totalNet=" + totalNet + ", increasRate="
				+ increaseRate + ", productId=" + productId + ", productName="
				+ productName + ", createrId=" + createrId + ", createrName="
				+ createrName + ", createDate=" + createDate
				+ ", lastModifyDate=" + lastModifyDate + "]";
	}
	
}
