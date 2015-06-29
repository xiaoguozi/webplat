package com.tjs.admin.zhifu.zfenum;

public enum CustBankIsquickEnum {
	   YES("1","是"),
	   
	    NO("2","否");
	   
	   /** 键 */
	   private String key;
		
		/** 整型键值 */
		private Integer integerKey;
		
		/** 值 */
		private String value;


		private CustBankIsquickEnum(String key, String value){
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
