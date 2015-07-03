package com.tjs.admin.withdraw.service;

import com.tjs.admin.zhifu.model.Withdraw;

public interface IWithdrawBizService {

	 /**
	  * 更新提现记录
	  * @param withdraw
	  * @return
	  */
	 int updateWithdraw(Withdraw withdraw,String usernName);
}
