package com.tjs.admin.zhifu.dao;

import java.util.List;

import com.tjs.admin.zhifu.controller.WithdrawCtrlModel;
import com.tjs.admin.zhifu.model.Withdraw;

public interface WithdrawMapper{
	/**充值记录数量*/
    public int countWithdraw(WithdrawCtrlModel withdrawCtrlModel);
    /**充值记录*/
    public List<Withdraw> selectWithdraw(WithdrawCtrlModel withdrawCtrlModel);
    /**插入充值记录*/
	public int  insertWithdraw(Withdraw recharge);
	/**跟新充值记录*/
	public int updateWithdraw(Withdraw recharge);
	/**根据主键删除充值记录*/
	public void deleteWithdraw(Long withdrawId);
	/**根据ID找到规则*/
	public Withdraw findByWithdrawId(Long withdrawId);
	
}
