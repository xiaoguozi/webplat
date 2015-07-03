package com.tjs.admin.zhifu.zfenum;

import java.util.HashMap;
import java.util.Map;

public enum BankImageEnum {
	BOC("BOC-NET-B2C", "zhongguo.gif"), 
	CMB("CMBCHINA-NET-B2C", "zhaohang.gif"), 
	CCB("CCB-NET-B2C", "jianshe.gif"), 
	ICBC("ICBC-NET-B2C", "gongshang.gif"), 
	ABC("ABC-NET-B2C", "nongye.gif"), 
	POST("POST-NET-B2C", "youzheng.gif"), 
	ECITIC("ECITIC-NET-B2C", "zhongxin.gif"), 
	CEB("CEB-NET-B2C", "guangda.gif"), 
	CIB("CIB-NET-B2C", "xingye.gif"), 
	BOCO("BOCO-NET-B2C", "jiaotong.gif"), 
	SPDB("SPDB-NET-B2C", "shangpufa.gif"), 
	HXB("HXB-NET-B2C", "huaxia.gif"), 
	PINGANBANK("PINGANBANK-NET-B2C", "pingan.gif"), 
	SHB("SHB-NET-B2C", "shanghaibank.gif"), 
	SDB("SDB-NET-B2C", "shenfa.gif"), 
	CMBC("CMBC-NET-B2C", "minsheng.gif");

	/** 键 */
	private String key;

	/** 值 */
	private String value;

	static Map<String, String> map = new HashMap<String, String>();
	static{
		for(BankImageEnum backNameEnum : BankImageEnum.values()){
			map.put(backNameEnum.getKey(), backNameEnum.getValue());
		}
	}
	
	private BankImageEnum(String key, String value) {
		this.key = key;
		this.value = value;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
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
