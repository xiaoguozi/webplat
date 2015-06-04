package com.tjs.web.peizi.model;

public class UserInfoExtendVO {

	/** 主键 */
	private Long id;
	
	/** 用户Id */
	private Long userId;
	
	/** 配资类型 */
	private int peiziType;

	/** 该用户是否已经使用过 */
	private int isUsed = 0;
	
	/** 是否占有了免费名额 */
	private int isOwnResource = 0;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public int getPeiziType() {
		return peiziType;
	}

	public void setPeiziType(int peiziType) {
		this.peiziType = peiziType;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	public int getIsOwnResource() {
		return isOwnResource;
	}

	public void setIsOwnResource(int isOwnResource) {
		this.isOwnResource = isOwnResource;
	}
	
	
}
