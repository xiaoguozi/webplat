package com.tjs.admin.constants;

import com.tjs.core.util.IEnum;

public enum TjwEnum implements IEnum {
	PTSY("10","平台首页"),
	BKSY("20","版块首页"),
	WTJ("30","无推荐");
	/** 键 */
	private String key;

	/** 整型键值 */
	private Integer integerKey;

	/** 值 */
	private String value;

	private TjwEnum(String key, String value) {
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