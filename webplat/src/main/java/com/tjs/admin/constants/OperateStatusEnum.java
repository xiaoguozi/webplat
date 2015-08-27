package com.tjs.admin.constants;

import com.tjs.core.util.IEnum;

public enum OperateStatusEnum implements IEnum  {
	NotOperate("10", "未处理"), 
	Operating("20", "处理中"),
	Operated("30", "已处理");
	/** 键 */
	private String key;

	/** 整型键值 */
	private Integer integerKey;

	/** 值 */
	private String value;

	private OperateStatusEnum(String key, String value) {
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
