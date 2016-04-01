package com.auchan.bem.bem_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 执行项controller
 * 
 * @url /execution
 * @date 2016-03-31
 * @author 郑冉
 *
 */
@Controller  
@RequestMapping("execution")
public class ExecutionController {
	
	/**
	 * execution首页
	 * 
	 * @url /execution
	 * @method get/post
	 * @return execution/index.jsp
	 * @date 2016-03-31
	 */
	@RequestMapping("")
	public String index(ModelMap model) {
		model.addAttribute("pageTitle", "执行/Execution");
		model.addAttribute("breadcrumbs", new String[][] {{"Execution"}});
		model.addAttribute("leftbar", "8");
		return "execution/index";
	}
}
