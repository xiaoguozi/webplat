package com.tjs.admin.kybx.constants;

import com.tjs.core.util.IEnum;

public enum KybxClassEnum implements IEnum {
	CXSX("10", "寿险"), 
	YLBX("20", "医疗"),
	BFGZ("30", "保费隔资");
	/** 键 */
	private String key;

	/** 整型键值 */
	private Integer integerKey;

	/** 值 */
	private String value;

	private KybxClassEnum(String key, String value) {
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
