package com.tjs.admin.filter;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.tjs.admin.system.utils.MongoUtils;

public class WebRootInitListener implements ServletContextListener{


	@Override
	public void contextInitialized(ServletContextEvent arg0) {
	
		
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		MongoUtils.close();		
	}

}
