package com.tjs.admin.constants;

import com.tjs.core.util.IEnum;

public enum ProductStatus implements IEnum {
	preline("10","未上线"),
	online("20","已上线"),
	offline("30","已下线");
	/** 键 */
	private String key;

	/** 整型键值 */
	private Integer integerKey;

	/** 值 */
	private String value;

	private ProductStatus(String key, String value) {
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
