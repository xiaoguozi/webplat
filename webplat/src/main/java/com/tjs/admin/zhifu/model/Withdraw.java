package com.tjs.admin.zhifu.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 提现
 * @author Administrator
 *
 */
public class Withdraw {		  
	  /**序号 */
	  private Long withrowId;
	  /**用户序号 */
	  private Long customerId;
	  /**银行 */
	  private String bankCode;
	  /**卡来源(0 电脑 1手机) */
	  private Integer cardFrom;
	  /**提现账号 */
	  private String cardNo;
	  /**所属省 */
	  private String bankProvince;
	  /** 所属城市*/
	  private String bankcity;
	  /** 提现金额*/
	  private BigDecimal amount;
	  /**手续费 */
	  private BigDecimal poundageAmount;
	  /**所属分行 */
	  private String branchName;
	  /**请求IP */
	  private String requestIp;
	  /**创建时间 */
	  private Date createTime;
	  /**创建人 */
	  private String createBy;
	  /**提现状态(0 待审核 1 待确定 2 完成 3 取消) */
	  private Integer status;
	  /**审核人 */
	  private String auditBy;
	  /**审核时间 */
	  private Date auditTime;
	  /**审核描述 */
	  private String auditDesc;
	  /**确定人 */
	  private String checkBy;
	  /**确定时间 */	  
	  private Date checkTime;
	  /**业务锁 */
	  private Integer lockId;
	public Long getWithrowId() {
		return withrowId;
	}
	public void setWithrowId(Long withrowId) {
		this.withrowId = withrowId;
	}
	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public Integer getCardFrom() {
		return cardFrom;
	}
	public void setCardFrom(Integer cardFrom) {
		this.cardFrom = cardFrom;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getBankProvince() {
		return bankProvince;
	}
	public void setBankProvince(String bankProvince) {
		this.bankProvince = bankProvince;
	}
	public String getBankcity() {
		return bankcity;
	}
	public void setBankcity(String bankcity) {
		this.bankcity = bankcity;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public BigDecimal getPoundageAmount() {
		return poundageAmount;
	}
	public void setPoundageAmount(BigDecimal poundageAmount) {
		this.poundageAmount = poundageAmount;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getRequestIp() {
		return requestIp;
	}
	public void setRequestIp(String requestIp) {
		this.requestIp = requestIp;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getAuditBy() {
		return auditBy;
	}
	public void setAuditBy(String auditBy) {
		this.auditBy = auditBy;
	}
	public Date getAuditTime() {
		return auditTime;
	}
	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}
	public String getAuditDesc() {
		return auditDesc;
	}
	public void setAuditDesc(String auditDesc) {
		this.auditDesc = auditDesc;
	}
	public String getCheckBy() {
		return checkBy;
	}
	public void setCheckBy(String checkBy) {
		this.checkBy = checkBy;
	}
	public Date getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}
	public Integer getLockId() {
		return lockId;
	}
	public void setLockId(Integer lockId) {
		this.lockId = lockId;
	}
	  
	  
	  
}
