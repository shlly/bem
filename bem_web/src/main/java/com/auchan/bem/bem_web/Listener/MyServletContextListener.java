package com.auchan.bem.bem_web.Listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.auchan.bem.bem_service.TopicService;
import com.auchan.bem.bem_web.Interceptor.PublicExceptionHandler;

/**
 * Application Lifecycle Listener implementation class MyServletContextListener
 *
 */
@WebListener
public class MyServletContextListener implements ServletContextListener {

	private static Logger Log = LoggerFactory.getLogger(PublicExceptionHandler.class);
	private ApplicationContext app;

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent event)  {
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event)  {
    	// 获取spring上下文
		app = WebApplicationContextUtils.getRequiredWebApplicationContext(event.getServletContext());
		// @service("") make a try
		// 获取bean
		 TopicService topicService = (TopicService) app.getBean("topicServiceImpl");
		 Log.info("路径初始化开始----------------------------------------------------");  
		 topicService.initTopicDirectory();
		 Log.info("路径初始化完成----------------------------------------------------");
    }
	
}
