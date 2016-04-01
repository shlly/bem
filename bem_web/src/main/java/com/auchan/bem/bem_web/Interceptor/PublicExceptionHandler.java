package com.auchan.bem.bem_web.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;


public class PublicExceptionHandler implements HandlerExceptionResolver {

	private static Logger Log = LoggerFactory.getLogger(PublicExceptionHandler.class);
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response,
			Object handler, Exception ex) {
		
		Log.error(handler + " - " + ex.toString());
		return new ModelAndView("redirect:/error/500");
	}
	
}
