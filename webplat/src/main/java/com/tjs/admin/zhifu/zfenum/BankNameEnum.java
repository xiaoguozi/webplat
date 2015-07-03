package com.tjs.admin.zhifu.zfenum;

import java.util.HashMap;
import java.util.Map;

public enum BankNameEnum {
	BOC("BOC-NET-B2C", "中国银行"), 
	CMB("CMBCHINA-NET-B2C", "招商银行"), 
	CCB("CCB-NET-B2C", "建设银行"), 
	ICBC("ICBC-NET-B2C", "中国工商银行"), 
	ABC("ABC-NET-B2C", "中国农业银行"), 
	POST("POST-NET-B2C", "中国邮政储蓄银行"), 
	ECITIC("ECITIC-NET-B2C", "中信银行"), 
	CEB("CEB-NET-B2C", "中国光大银行"), 
	CIB("CIB-NET-B2C", "兴业银行"), 
	BOCO("BOCO-NET-B2C", "交通银行"), 
	SPDB("SPDB-NET-B2C", "浦发银行"), 
	HXB("HXB-NET-B2C", "华夏银行"), 
	PINGANBANK("PINGANBANK-NET-B2C", "平安银行"), 
	SHB("SHB-NET-B2C", "上海银行"), 
	SDB("SDB-NET-B2C", "深圳发展银行"), 
	CMBC("CMBC-NET-B2C", "民生银行");

	/** 键 */
	private String key;

	/** 整型键值 */
	private Integer integerKey;

	/** 值 */
	private String value;

	static Map<String, String> map = new HashMap<String, String>();
	static{
		for(BankNameEnum backNameEnum : BankNameEnum.values()){
			map.put(backNameEnum.getKey(), backNameEnum.getValue());
		}
	}
	
	private BankNameEnum(String key, String value) {
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
	
	public static String getValue(String key){
		return map.get(key);
	}

}
