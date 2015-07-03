package com.tjs.admin.zhifu.exception;

public class DuplicateException extends RuntimeException{
  
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DuplicateException(String exceptionInfo){
		super(exceptionInfo);
	}
}
