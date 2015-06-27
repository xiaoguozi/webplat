package com.tjs.admin.zhifu.model;

import java.math.BigDecimal;

/**
 * 个人账户
 * @author hzg
 *
 */
public class CustomerFund {
	/**个人账户流水号 */
	private Long customerFundId;
	/**客服ID */
	private Long customerId;
	/**账户总额 */
	private BigDecimal totalFund;
	/**可用金额 */
	private BigDecimal usebleFund ;
	/**配资金额 */
	private BigDecimal peiziFund;
	/**风险保证金 */
	private BigDecimal fxbzFund ;
	/**冻结金额 */
	private BigDecimal dongjieFund;
	
	public Long getCustomerFundId() {
		return customerFundId;
	}
	public void setCustomerFundId(Long customerFundId) {
		this.customerFundId = customerFundId;
	}
	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public BigDecimal getTotalFund() {
		return totalFund;
	}
	public void setTotalFund(BigDecimal totalFund) {
		this.totalFund = totalFund;
	}
	public BigDecimal getUsebleFund() {
		return usebleFund;
	}
	public void setUsebleFund(BigDecimal usebleFund) {
		this.usebleFund = usebleFund;
	}
	public BigDecimal getPeiziFund() {
		return peiziFund;
	}
	public void setPeiziFund(BigDecimal peiziFund) {
		this.peiziFund = peiziFund;
	}
	public BigDecimal getFxbzFund() {
		return fxbzFund;
	}
	public void setFxbzFund(BigDecimal fxbzFund) {
		this.fxbzFund = fxbzFund;
	}
	public BigDecimal getDongjieFund() {
		return dongjieFund;
	}
	public void setDongjieFund(BigDecimal dongjieFund) {
		this.dongjieFund = dongjieFund;
	}
	
	  

}
