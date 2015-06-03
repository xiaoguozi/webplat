package com.tjs.admin.peizi.constants;

public enum PeiziTypeEnum {
	/**免费配资*/
	MFPEIZI("10","免费配资"),
	
	/**免费配资*/
	TTPEIZI("20","天天配"),
	
	/**免费配资*/
	YYPEIZI("30","月月配"),
	
	/**免费配资*/
	DXPEIZI("40","低息配");
	
	
	
	 /** 键 */
    private String key;
    
    /** 整型键值 */
    private Integer integerKey;
    
    /** 值 */
    private String value;
    
    
    private PeiziTypeEnum(String key, String value){
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
