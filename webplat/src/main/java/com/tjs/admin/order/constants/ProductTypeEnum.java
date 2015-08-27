package com.tjs.admin.order.constants;

import com.tjs.core.util.IEnum;

public enum ProductTypeEnum implements IEnum {
	XinTuo("10", "信托"), 
	Simu("20", "私募"),
	PZ("30", "配资"),
	Kybx("40", "海外保险");
	
	/** 键 */
	private String key;

	/** 整型键值 */
	private Integer integerKey;

	/** 值 */
	private String value;
	
	private ProductTypeEnum(String key, String value) {
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
		// TODO Auto-generated method stub
		return this.name();
	}
	
}
