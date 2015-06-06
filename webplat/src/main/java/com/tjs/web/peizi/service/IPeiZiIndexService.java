package com.tjs.web.peizi.service;

import java.util.List;

import com.tjs.web.peizi.controller.PZIndexCtrlModel;
import com.tjs.web.peizi.model.FreePeiziDetailVO;
import com.tjs.web.peizi.model.UserInfoExtendVO;

public interface IPeiZiIndexService {

	/**
	 * 检查是否可以参加活动
	 * @param pzIndexCtrlModel PZIndexCtrlModel
	 * @return int PeiZiConstants.RESULT_* 检查结果
	 */
	public int checkFreePeiZiIsValid(PZIndexCtrlModel pzIndexCtrlModel);
	
	public List<FreePeiziDetailVO> getFreePeiziDetailList(PZIndexCtrlModel pzIndexCtrlModel);
	
	public List<UserInfoExtendVO> getUserInfoExtendList(PZIndexCtrlModel pzIndexCtrlModel);
	
	public void createFreePeiziOrder(UserInfoExtendVO userInfoExtendVO);
	
}
