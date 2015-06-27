package com.tjs.admin.zhifu.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 资金流水
 * @author Administrator
 *
 */
public class FundRecord {	  
	  /**序号 */
	  private  Long recordId;
	  /**用户序号 */
      private Long customerId;
      /**资金类型10:充值,20配资风险保证金,30借款利息,40配资收益,50,提现 */
      private String FundType;
      /**操作金额 */
      private BigDecimal amount;
      /**可用金额 */
      private BigDecimal usableAmount;
      /**业务序号(提现对应提现的id 充值对应充值的ID) */
      private Long businessId;
      /**操作描述 */
      private String recordDesc;
      /**创建时间 */
      private Date createTime;
      /**创建人 */
      private String createBy;
	public Long getRecordId() {
		return recordId;
	}
	public void setRecordId(Long recordId) {
		this.recordId = recordId;
	}
	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public String getFundType() {
		return FundType;
	}
	public void setFundType(String fundType) {
		FundType = fundType;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public BigDecimal getUsableAmount() {
		return usableAmount;
	}
	public void setUsableAmount(BigDecimal usableAmount) {
		this.usableAmount = usableAmount;
	}
	public Long getBusinessId() {
		return businessId;
	}
	public void setBusinessId(Long businessId) {
		this.businessId = businessId;
	}
	public String getRecordDesc() {
		return recordDesc;
	}
	public void setRecordDesc(String recordDesc) {
		this.recordDesc = recordDesc;
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
      
      
	  
}
