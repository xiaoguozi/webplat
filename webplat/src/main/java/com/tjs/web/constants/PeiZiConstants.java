package com.tjs.web.constants;

public class PeiZiConstants {

	/** 免费配总数量 */
	public static final int FREE_ALL_COUNT = 100;
	
	/** 免息配总数量 */
	public static final int FREE_CHARGE_COUNT = 100;
	
	/** 免费配 */
	public static final int TYPE_FREE_ALL = 1;
	
	/** 免息配 */
	public static final int TYPE_FREE_CHARGE = 2;
	
	/** 是否已经使用过了  */
	public static final int IS_USED = 1;
	
	/** 是否已经拥有了名额 */
	public static final int IS_OWN_RESOURCE = 1;
	
	/** 检查结果返回值 -- 已经没有名额   -1  */
	public static final int RESULT_NO_AMOUNT = -1;
	
	/** 检查结果返回值 -- 用户已经参加过该活动   -2  */
	public static final int RESULT_ALREADY_USED = -2;
	
	/** 检查结果返回值 -- 可以参加该活动   1  */
	public static final int RESULT_VALID = 1;
	
}
