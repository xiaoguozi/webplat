package com.tjs.admin.zhifu.zfenum;

public enum FundRecordFundTypeEnum {
	
	    CZ("00001","充值"),
	   
	    JKLX("00002","借款利息"),
	    
	    TZBZJ("00003","投资保证金"),
	    
	    PZJE("00004","配资金额"),
	    
	    TXDJ("00005","提现冻结"),
	    
	    TXCG("00006","提现成功");
	    
	   	   
	   /** 键 */
	   private String key;
		
		
		/** 值 */
		private String value;


		private FundRecordFundTypeEnum(String key, String value){
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
}
