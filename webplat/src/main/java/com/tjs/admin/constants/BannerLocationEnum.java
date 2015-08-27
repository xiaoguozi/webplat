package com.tjs.admin.constants;

import com.tjs.core.util.IEnum;

public enum BannerLocationEnum implements IEnum {
	Index("10","首页banner"),
	XtIndex("20","信托首页banner"),
	SmIndex("30","私募首页banner"),
	PzIndex("40","配资首页banner"),
	KybxIndex("50","保险首页banner");
	/** 键 */
	private String key;

	/** 整型键值 */
	private Integer integerKey;

	/** 值 */
	private String value;

	private BannerLocationEnum(String key, String value) {
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

	@Override
	public String getName() {
		return this.name();
	}
	
}
