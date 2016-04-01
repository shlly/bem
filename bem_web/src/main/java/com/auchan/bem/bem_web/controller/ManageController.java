package com.auchan.bem.bem_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 组织controller
 * 
 * @url /manage
 * @date 2016-03-24
 * @author 郑冉
 *
 */
@Controller  
@RequestMapping("manage")
public class ManageController {
	
	/**
	 * 权限管理页面
	 * 
	 * @url /manage/authorize
	 * @method get/post
	 * @return manage/authorize.jsp
	 * @date 2016-03-24
	 */
	@RequestMapping("authorize")
	public String authorize(ModelMap model) {
		model.addAttribute("pageTitle", "权限管理/Authorize Manage");
		model.addAttribute("breadcrumbs", new String[][] {{"Manage"}, {"Authorize"}});
		model.addAttribute("leftbar", "5");
		return "manage/authorize";
	}
	
	/**
	 * 主题管理页面
	 * 
	 * @url /manage/topic
	 * @method get/post
	 * @return manage/topic.jsp
	 * @date 2016-03-28
	 */
	@RequestMapping("topic")
	public String topic(ModelMap model) {
		model.addAttribute("pageTitle", "主题管理/Topic Manage");
		model.addAttribute("breadcrumbs", new String[][] {{"Manage"}, {"Topic"}});
		model.addAttribute("leftbar", "4");
		return "manage/topic";
	}
}
