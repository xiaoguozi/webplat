package com.tjs.admin.zhifu.zfenum;

public enum RechargeFundTypeEnum  {
	
	   YIBAOZHIFU("1","易宝支付");	   	   
	   /** 键 */
	   private String key;
		
		/** 整型键值 */
		private Integer integerKey;
		
		/** 值 */
		private String value;

		private RechargeFundTypeEnum(String key, String value){
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
