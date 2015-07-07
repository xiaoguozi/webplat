package com.tjs.admin.peizi.constants;

public enum OperaStatusEnum {
	
	/**免费配资*/
	PZPay("1","待支付"),
	
	/**免费配资*/
	PZZhong("10","配资中"),
	
	/**免费配资*/
	CPZHONG("20","操盘中"),
	
	/**免费配资*/
	YWJIE("30","已完结"),
	
	/**免费配资*/
	PZCANCEL("40","取消");
	
	 /** 键 */
    private String key;
    
    /** 整型键值 */
    private Integer integerKey;
    
    /** 值 */
    private String value;
    
    
    private OperaStatusEnum(String key, String value){
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
