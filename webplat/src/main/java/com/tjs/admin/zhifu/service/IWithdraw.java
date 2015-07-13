package com.tjs.admin.zhifu.service;

import java.util.List;

import com.tjs.admin.zhifu.controller.WithdrawCtrlModel;
import com.tjs.admin.zhifu.model.Withdraw;

public interface IWithdraw {
	/**提现记录数量*/
    public int countWithdraw(WithdrawCtrlModel withdrawCtrlModel);
    /**提现记录*/
    public List<Withdraw> selectWithdraw(WithdrawCtrlModel withdrawCtrlModel);
    /**插入提现记录*/
	public int  insertWithdraw(Withdraw withdraw);
	/**跟新提现记录*/
	public int updateWithdraw(Withdraw withdraw);
	/**根据主键删除提现记录*/
	public int deleteWithdraw(Long withdrawId);
	/**根据ID找到规则*/
	public Withdraw findByWithdrawId(Long withdrawId);	
	  /**提现记录*/
    public List<Withdraw> selectWithdrawByIds(Long[] ids);
}
