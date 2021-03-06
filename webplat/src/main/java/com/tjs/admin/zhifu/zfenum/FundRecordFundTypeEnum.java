package com.tjs.admin.zhifu.zfenum;

public enum FundRecordFundTypeEnum {
	
	     /**充值+*/
	    CZ("00001","充值"),
	     /**借款利息-*/
	    JKLX("00002","借款利息"),
	    /**借款利息-*/
	    TZBZJ("00003","投资保证金"),
	    /**配资金额+*/
	    PZJE("00004","配资金额"),
	    /**提现冻结息-*/
	    TXDJ("00005","提现冻结"),
	    /**提现成功-*/
	    TXCG("00006","提现成功"),
	    /**提现失败+*/
	    TXSB("00007","提现失败"),	
	    /**收回配资金额-*/
	    SHPZJE("00008","收回配资金额"),
	      /**返还投资保证金+*/
	    HHTZBZJ("00009","返还投资保证金"),
	     /**返还投资保证金+*/
	    PZSH("00010","配资收益"),
	     /**扣除风险保证-*/
	    KCFXBZJ("00011","扣除风险保证金"),
	    /**返还借款利息+*/
	    FHJKLX("00012","返还借款利息");
	    
	    
	      	   
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
