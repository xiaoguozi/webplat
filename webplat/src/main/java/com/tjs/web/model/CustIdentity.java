package com.tjs.web.model;

import java.util.Date;

public class CustIdentity {

	/** 序号 */
	private Long identifyId;
	/** userId */
	private Long customerId;
	/** 证件类型 0 身份证 1 其他 */
	private int identifyType;
	/** 真实姓名 */
	private String realName;
	/** 身份证号 */
	private String cardNo;
	/** 提交时间 */
	private Date createTime;
	/** 验证方式(0 自动 1 手动) */
	private int validType;
	/** 状态(0 待审核 1 正确 2 不正确 ) */
	private int status;
	/** 审核人 */
	private String auditBy;
	/** 审核时间 */
	private Date auditTime;
	/** 审核意见 */
	private String auditDesc;
	
	public Long getIdentifyId() {
		return identifyId;
	}
	public void setIdentifyId(Long identifyId) {
		this.identifyId = identifyId;
	}
	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public int getIdentifyType() {
		return identifyType;
	}
	public void setIdentifyType(int identifyType) {
		this.identifyType = identifyType;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getValidType() {
		return validType;
	}
	public void setValidType(int validType) {
		this.validType = validType;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
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
	
	
	
}
