package com.tjs.web.peizi.dao;

import java.util.List;

import com.tjs.web.peizi.controller.PZIndexCtrlModel;
import com.tjs.web.peizi.model.FreePeiziDetailVO;
import com.tjs.web.peizi.model.UserInfoExtendVO;

public interface PeiZiIndexMapper {

	int insertFreePeiziDetailVO(FreePeiziDetailVO freePeiziDetailVO);
	
	int updateFreePeiziDetailVO(FreePeiziDetailVO freePeiziDetailVO);
	
	List<FreePeiziDetailVO> getFreePeiziDetailList(PZIndexCtrlModel pzIndexCtrlModel);
	
	int insertUserInfoExtendVO(UserInfoExtendVO userInfoExtendVO);
	
	int updateUserInfoExtendVO(UserInfoExtendVO userInfoExtendVO);
	
	List<UserInfoExtendVO> getUserInfoExtendList(PZIndexCtrlModel pzIndexCtrlModel);
	
}
