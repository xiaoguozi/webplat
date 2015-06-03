package com.tjs.web.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tjs.admin.utils.StringUtils;

/**
 * 登录、认证过滤器，完成登录流程并跳转
 * @author hzg
 */
public class AuthenticationFilter extends FormAuthenticationFilter{
	
	private Logger logger = LoggerFactory.getLogger(AuthenticationFilter.class);

	@Override
	protected boolean onLoginSuccess(AuthenticationToken token,
			Subject subject, ServletRequest request, ServletResponse response)
			throws Exception {
		
		logger.debug(request.getRemoteHost());
		return super.onLoginSuccess(token, subject, request, response);
	}
	
	
	
	
	
}
