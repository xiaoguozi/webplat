package com.tjs.admin.zhifu.dao;

import java.util.List;

import com.tjs.admin.peizi.model.Peizi;
import com.tjs.admin.zhifu.controller.RechargeCtrlModel;
import com.tjs.admin.zhifu.model.Recharge;

public interface RechargeMapper{
	/**充值记录数量*/
    public int countRecharge(RechargeCtrlModel rechargeCtrlModel);
    /**充值记录*/
    public List<Recharge> selectRecharge(RechargeCtrlModel rechargeCtrlModel);
    /**插入充值记录*/
	public int  insertRecharge(Recharge recharge);
	/**跟新充值记录*/
	public int updateRecharge(Recharge recharge);
	/**根据主键删除充值记录*/
	public void deleteRecharge(Long rechangeId);
	/**根据ID找到规则*/
	public Recharge findByRechargeId(Long rechangeId);
	
}
