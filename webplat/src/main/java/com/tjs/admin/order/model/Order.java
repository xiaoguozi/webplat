package com.tjs.admin.order.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 预约信息
 * @author hzg
 *
 */
public class Order {
	
	     /**订单流水号 */
		private Long id;
		/**订单提交人ID */
		private  Long userID;
		/**订单人名称 */
		private String userName;
		/**订单人电话 */
		private String telphone;
		/**订单产品ID */
		private Long productId;
		/** 订单产品名称 */
		private String productName;
		/**订单产品类型  */
		private String productType;
		/** 订单处理状态 */
		private String operateStatus;
		/**订单处理人ID  */
		private String operateId;
		/**订单处理人  */
		private String operateName;
		/**订单创建时间  */
		 @DateTimeFormat(pattern="yyyy-MM-dd")
		private Date createDate;
		/**订单处理时间  */
		 @DateTimeFormat(pattern="yyyy-MM-dd")
		private Date operateDate;
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public Long getUserID() {
			return userID;
		}
		public void setUserID(Long userID) {
			this.userID = userID;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getTelphone() {
			return telphone;
		}
		public void setTelphone(String telphone) {
			this.telphone = telphone;
		}
		public Long getProductId() {
			return productId;
		}
		public void setProductId(Long productId) {
			this.productId = productId;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public String getProductType() {
			return productType;
		}
		public void setProductType(String productType) {
			this.productType = productType;
		}
		public String getOperateStatus() {
			return operateStatus;
		}
		public void setOperateStatus(String operateStatus) {
			this.operateStatus = operateStatus;
		}
		public String getOperateId() {
			return operateId;
		}
		public void setOperateId(String operateId) {
			this.operateId = operateId;
		}
		public String getOperateName() {
			return operateName;
		}
		public void setOperateName(String operateName) {
			this.operateName = operateName;
		}
		public Date getCreateDate() {
			return createDate;
		}
		public void setCreateDate(Date createDate) {
			this.createDate = createDate;
		}
		public Date getOperateDate() {
			return operateDate;
		}
		public void setOperateDate(Date operateDate) {
			this.operateDate = operateDate;
		}
		

			


}
