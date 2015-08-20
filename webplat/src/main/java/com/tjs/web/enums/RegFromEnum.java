package com.tjs.web.enums;

/**
 * 注册来源
 * @author Administrator
 *
 */
public enum RegFromEnum {
	PC("0", "PC端"), 
	PHONE("1", "手机端"),
	WEIXIN_RMD("5", "微信推荐"),
	LINK_RMD("6", "链接推荐"),
	OFFLINE_RMD("7", "线下推广"),
	HSR("10", "高铁");
	
	/** 键 */
	private String key;

	/** 整型键值 */
	private Integer integerKey;

	/** 值 */
	private String value;

	private RegFromEnum(String key, String value) {
		this.key = key;
		this.value = value;
		this.integerKey = Integer.valueOf(key);
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Integer getIntegerKey() {
		return integerKey;
	}

	public void setIntegerKey(Integer integerKey) {
		this.integerKey = integerKey;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
