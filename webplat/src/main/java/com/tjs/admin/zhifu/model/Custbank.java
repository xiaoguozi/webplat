package com.tjs.admin.zhifu.model;

import java.util.Date;

/**
 * 个人银行卡
 * @author hzg
 *
 */
public class Custbank {
	/**序号*/
	private Long bankId;
	 /**用户序号 */
	private Long customerId;
	/**卡来源(0 电脑 1手机)*/
	private Integer cardForm;	
	/**银行代号*/
	private String bankCode;	
	/**卡号 */
	private String  cardNo;
	/**省份 */
	private String  bankProvince;
	/**所属城市 */
	private String bankCity;
	/**是否快捷支付 */
	private Integer isQuick;
	/**所属分行*/
	private String branchName;
	/**添加时间 */
	private Date createTime;
	public Long getBankId() {
		return bankId;
	}
	public void setBankId(Long bankId) {
		this.bankId = bankId;
	}
	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public Integer getCardForm() {
		return cardForm;
	}
	public void setCardForm(Integer cardForm) {
		this.cardForm = cardForm;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
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
	public String getBankCity() {
		return bankCity;
	}
	public void setBankCity(String bankCity) {
		this.bankCity = bankCity;
	}
	public Integer getIsQuick() {
		return isQuick;
	}
	public void setIsQuick(Integer isQuick) {
		this.isQuick = isQuick;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}	
}
