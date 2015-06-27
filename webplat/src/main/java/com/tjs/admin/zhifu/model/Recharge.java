package com.tjs.admin.zhifu.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 充值记录
 * @author Administrator
 *
 */
public class Recharge {
	  /**序号 */
	  private Long rechangeId;
	 /**用户序号 */
	  private Long customerId;
	  /** 充值类型*/
	  private String fundType;
	  /**充值金额 */
	  private BigDecimal amount;
	  /**充值状态(0 未完成 1 成功 2 失败) */
	  private Integer status;
	  /**充值流水号 */
	  private String paynumber;
	  /**充值账号 */
	  private String cardNo;
	  /**充值描述 */
	  private String recordDesc;
	  /**请求IP */
	  private String requestIp;
	  /**创建时间 */
	  private String createTime;
	  /**创建人 */
	  private String createBy;
	  /**如果有线下充值，可以通过后台管理加值的 */
	  private String auditBy;
	  /**成功时间 */
	  private Date updateTime;
	  /** 锁*/
	  private Integer lockId;
	public Long getRechangeId() {
		return rechangeId;
	}
	public void setRechangeId(Long rechangeId) {
		this.rechangeId = rechangeId;
	}
	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public String getFundType() {
		return fundType;
	}
	public void setFundType(String fundType) {
		this.fundType = fundType;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getPaynumber() {
		return paynumber;
	}
	public void setPaynumber(String paynumber) {
		this.paynumber = paynumber;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getRecordDesc() {
		return recordDesc;
	}
	public void setRecordDesc(String recordDesc) {
		this.recordDesc = recordDesc;
	}
	public String getRequestIp() {
		return requestIp;
	}
	public void setRequestIp(String requestIp) {
		this.requestIp = requestIp;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public String getAuditBy() {
		return auditBy;
	}
	public void setAuditBy(String auditBy) {
		this.auditBy = auditBy;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getLockId() {
		return lockId;
	}
	public void setLockId(Integer lockId) {
		this.lockId = lockId;
	}	  	  	  
}
